let editor = document.querySelector(".post")
let editorMenu = document.querySelector(".editor-menu")
let menuLength = editorMenu.children.length

const allowedExtensions = ["jpg", "png", "jfif", "jpeg"]

let keyInput = document.querySelector(".key-input")
let settings = document.querySelector(".publication-settings")
let cover = document.querySelector(".cover-wrapper")

let keywords = []

let requires = ["cover", "header", "keyword"]

let currentMenuItem = 0

let currentElement, div

let listMenu = `
    <div class="editor-menu-item" data-create="ul">Lista</div>
    <div class="editor-menu-item" data-create="ol">Lista numerowana</div>
`

let defaultMenu = `
    <div class="editor-menu-item" data-create="header">Zagłówek</div>
    <div class="editor-menu-item" data-create="table">Tabela</div>
    <div class="editor-menu-item" data-create="image">Zdjęcie</div>
    <div class="editor-menu-item" data-create="ul">Lista</div>
    <div class="editor-menu-item" data-create="ol">Lista numerowana</div>
    <div class="editor-menu-item" data-create="hr">Rozdzielać</div>
`

function checkRequires(){
    let publicateBtn = document.querySelector(".publicate-btn")
    publicateBtn.removeEventListener("click", publicate)
    publicateBtn.setAttribute("disabled")

    function publicate(){
        document.querySelectorAll(".node-remove, .settings-wrapper").forEach(el => el.remove())
        
        document.querySelectorAll("[contenteditable], [data-empty]").forEach(el => el.removeAttribute("contenteditable"))

        let form = new FormData()
        form.append("content", editor.innerHTML)
        form.append("header", document.querySelector(".post-header").textContent)
        console.log(editor.innerHTML)
        fetch("../php_scripts/upload_post.php", {
            method: "POST",
            body: form
        })
    }

    if (requires.length == 0){
        publicateBtn.addEventListener("click", publicate)
        publicateBtn.removeAttribute("disabled")
    }
}

cover.addEventListener("click", (e) => {
    let input = cover.querySelector("input") 
    input.click()

    input.onchange = (e) => {
        let reader = new FileReader()
        
        reader.readAsDataURL(input.files[0])

        reader.onload = (e) => {
            cover.querySelector("img").src = reader.result

            if (requires.includes("cover"))
                requires.splice(requires.indexOf("cover"), 1)
            checkRequires()

            cover.querySelector(".cover").classList.remove("is-empty")
        }
    }

})

document.addEventListener("mousedown", (e) => {
    console.log(e.target)
    if (e.target == document.querySelector(".editor-footer .settings-btn")){
        settings.classList.toggle("hidden")
    }
    else if (![...settings.querySelectorAll("*"), settings].includes(e.target)){
        settings.classList.add("hidden")
    }
})

function createKeyWord(e){
    let value = e.target.value
    if (value.at(-1) == "," && value.length > 1){

        if (requires.includes("keyword"))
            requires.splice(requires.indexOf("keyword"), 1)

        let word = value.slice(0, value.length - 1)
        if (keywords.includes(word)){
            e.target.value = ""
            return
        }

        let keyWord = document.createElement("div")
        let deleteBtn = document.createElement("div")
        
        keyWord.className = "key-word"
        deleteBtn.className = "delete-btn"
        
        keyWord.textContent = word
        keyWord.appendChild(deleteBtn)

        deleteBtn.addEventListener("click", () => {
            keyWord.remove()

            keywords.splice(keywords.indexOf(keyWord.textContent), 1)
            if (keywords.length == 9){
                let input = document.createElement("input")

                input.className = "key-input"
                input.placeholder = "Wpisz od 1 do 10 słów kluczowych, rozdzielając przecinkiem"
                input.type = "text"

                document.querySelector(".key-input-wrapper").appendChild(input)
                

                input.addEventListener("input", createKeyWord)
                keyInput = input
            }
            else if (keywords.length == 0 && !requires.includes("keyword")){
                requires.push("keyword")
            }
        })

        checkRequires()

        e.target.value = ""

        e.target.parentElement.insertBefore(keyWord, e.target)
        keywords.push(value.slice(0, value.length - 1))

        if (keywords.length >= 10){
            keyInput.removeEventListener("input", createKeyWord)

            keyInput.remove()
        }
    }
}

keyInput.addEventListener("input", createKeyWord)

let editorObserver = new MutationObserver((mutations) => {
    mutations.forEach((mutation) => {
        if (mutation.addedNodes.length > 0 && editor.children.length > 1){
            console.log(mutation)
            mutation.addedNodes[0].className = "paragraph is-empty"

            mutation.addedNodes[0].dataset.empty = 'Wpisz "/", aby otworzyć menu' 

            contentObserver.observe(mutation.addedNodes[0], {
                characterData: true,
                subtree: true,
                childList: true
            })
        }
    })
})

let contentObserver = new MutationObserver((mutations) => {
    mutations.forEach((mutation) => {

        let element = mutation.target.parentElement

        if (document.querySelectorAll(".post-header br").length > 1)
            document.querySelector(".post-header br").remove()

        console.log(element)
        if (element != null && [...element.classList].includes("post-header")){
            if (document.querySelector(".post-header").textContent.length > 0 && requires.includes("header")){
                requires.splice(requires.indexOf("header"), 1)
            }
            else if (document.querySelector(".post-header").textContent.length == "" && !requires.includes("header")){
                requires.push("header")
            }
            checkRequires()
        }

        if (mutation.type == "characterData" && mutation.target.textContent.length > 0 && element != null)
            element.classList.remove("is-empty")

        if (mutation.type == "childList" && ((mutation.addedNodes.length > 0 && mutation.addedNodes[0].localName == "br") || mutation.target.textContent.length == 0)){
            mutation.target.classList.add("is-empty")
        }

        if (element != null && element.className.includes("paragraph"))
            currentElement = element

        if (element != null && [...element.parentElement.classList].includes("node-wrapper")){
            element.onkeydown = (e) => {
                if (e.key == "Enter"){
                    e.preventDefault()
                    setSelection(currentElement, -1)
                }
                element.onkeydown = null
            }
        }

        if (
            mutation.type == "characterData" && mutation.target.textContent == "/" 
            && (element.className.includes("paragraph") || element.className.includes("list-item"))
            || (mutation.type == "characterData" && mutation.target.textContent.at(-1) == "/" 
            && element.className.includes("list-item"))
            )
        {
            
            if (element.className.includes("list-item")){
                editorMenu.innerHTML = listMenu
                menuLength = editorMenu.children.length
            }
            else{
                editorMenu.innerHTML = defaultMenu
                menuLength = editorMenu.children.length
            }

            editorMenu.style.top = `${editor.offsetTop + element.offsetTop + 30}px`
            editorMenu.style.left = `${element.offsetLeft + editor.offsetLeft}px`
            
            if (scrollY + innerHeight < editorMenu.offsetTop + editorMenu.offsetHeight)
                editorMenu.style.transform = "translateY(-115%)"
            else
                editorMenu.style.transform = ""

            editorMenu.classList.add("active")
            currentMenuItem = 0

            setMenuItem()

            editor.onkeydown = (e) => {
                if (["Enter", "ArrowUp", "ArrowDown"].includes(e.key)){
                    e.preventDefault()
                    if (e.key == "Enter")
                        createElement(editorMenu.children[currentMenuItem].dataset.create)

                    else if (e.key == "ArrowUp")
                        currentMenuItem--

                    else if (e.key == "ArrowDown")
                        currentMenuItem++

                    if (currentMenuItem < 0)
                        currentMenuItem = menuLength - 1
                    else if (currentMenuItem > menuLength - 1)
                        currentMenuItem = 0 
                    
                    setMenuItem()
                    
                }
                else{
                    editor.onkeydown = null
                    editorMenu.classList.remove("active")
                }
            }

            
        }
        else{
            editor.onkeydown = null
            
            editorMenu.classList.remove("active")
        }
    })
})

editorObserver.observe(editor, {
    childList: true
})

contentObserver.observe(document.querySelector(".post-header"), {
    characterData: true,
    subtree: true,
    childList: true
})

contentObserver.observe(document.querySelector(".paragraph"), {
    characterData: true,
    subtree: true,
    childList: true
})

function setMenuItem(){
    if (editorMenu.querySelector(".item-hovered"))
        editorMenu.querySelector(".item-hovered").classList.remove("item-hovered")

    editorMenu.children[currentMenuItem].classList.add("item-hovered")
}

document.addEventListener("click", () => {
    document.querySelector(".editor-menu").classList.remove("active")
})

function createDivElement(className){
    let wrapper = document.createElement("div")
    let removeBtn = document.createElement("div")
    div = document.createElement("div")

    wrapper.setAttribute("contenteditable", "false")
    removeBtn.setAttribute("contenteditable", "false")
    div.setAttribute("contenteditable", "true")

    currentElement.textContent = ""
    
    wrapper.appendChild(div)
    wrapper.appendChild(removeBtn)

    removeBtn.addEventListener("click", () => {
        wrapper.remove()
    })

    setTimeout(() => {
        wrapper.className = "node-wrapper"
        removeBtn.className = "node-remove"
    }, 0)

    window.getSelection().anchorNode.parentElement.insertBefore(wrapper, currentElement)

}

function createHeader(){
    createDivElement()

    setTimeout(() => {
        setSelection(div)
        div.className = "content-header is-empty"
        div.dataset.empty = "Zagłówek"
    }, 0)
    
}

function createImage(){
    createDivElement()

    setTimeout(() => {
        div.className = "image-wrapper is-empty"

        div.setAttribute("contenteditable", false)
    
        div.innerHTML = `
            <input type="file" style="display: none"/>
            <div class="image-container is-empty" data-empty="Wybierz zdjęcie">
                <img src="" alt="" />
            </div>
            <div class="image-description is-empty" data-empty="Dodać opis" contenteditable="true"></div>
        `
    
        div.querySelector(".image-container").onclick = () => {
            let input = div.querySelector("input") 
            
            input.onchange = (e) => {
                let reader = new FileReader()
                
                let form = new FormData()

                reader.readAsDataURL(input.files[0])

                reader.onload = (e) => {
                    console.log(reader, e)
                }

                form.append("image", input.files[0])

                fetch("../php_scripts/upload_img.php", {
                    method: "POST",
                    body: form
                })
                .then((response) => response.text())
                .then((data) => {
                    div.querySelector("img").setAttribute("src", `/notegram/users_imgs/${data}`)
                    div.classList.remove("is-empty")    
                    div.querySelector(".image-container").classList.remove("is-empty")    
                    div.querySelector(".image-container").onclick = null
        
                    input.onchange = null

                })

            }
            input.click()
        }
    }, 0)
}

function setSelection(element, offset = 0){
    let selection = window.getSelection()

    let range = document.createRange()

    if (element.firstChild != null)
        element = element.firstChild

    if (offset == -1)
        offset = element.textContent.length

    range.setStart(element, offset)

    selection.removeAllRanges()
    selection.addRange(range)
}

function createList(ordered = false){
    let ul = document.createElement(ordered? "ol" : "ul")
    ul.setAttribute("contenteditable", "false")

    let selection = window.getSelection()

    if (selection.anchorNode.parentElement.parentElement.localName == "ol" || selection.anchorNode.parentElement.parentElement.localName == "ul"){
        if (selection.anchorNode.textContent.length <= 1)
            selection.anchorNode.textContent = "...."

        selection.anchorNode.parentElement.removeEventListener("keydown", listUpdating)

        let text = selection.anchorNode.parentElement.textContent

        selection.anchorNode.parentElement.textContent = text.substring(0, text.length - 1)

        selection.anchorNode.appendChild(ul)
    }
    else{
        let div = document.createElement("div")
        
        editor.insertBefore(div, currentElement)
        div.appendChild(ul)

        currentElement.textContent = ""

        setTimeout(() => {
            div.className = "list-wrapper"
        }, 0)
    }    

    setTimeout(() => {

        ul.className = "list-container"
    
        ul.innerHTML = `
                <li class="list-item" contenteditable="true"></li>
        `

        ul.querySelector("li").addEventListener("keydown", listUpdating)

        setSelection(ul.firstElementChild)
    }, 0)
}

function listUpdating(e){
    let ul = e.target.parentElement

    if (e.key == "Backspace"){
        if (window.getSelection().anchorOffset == 0){
            e.preventDefault()
            console.log(currentElement)
            if (ul.childElementCount <= 1){
                if (["ul", "li", "ol"].includes(ul.parentElement.localName)){
                    setSelection(ul.parentElement.firstChild, -1)
                    ul.parentElement.addEventListener("keydown", listUpdating)
                }
                else{
                    ul.parentElement.remove()
                    setSelection(currentElement, -1)
                }
                console.log(currentElement)

                ul.parentElement.removeChild(ul)
                return
            }

            let listText = e.target.textContent

            let itemIndex = [...ul.children].indexOf(e.target)

            if (itemIndex == 0)
                itemIndex == 1

            ul.removeChild(e.target) 
            ul.children[itemIndex - 1].firstChild.textContent += listText

            if (ul.children[itemIndex - 1].querySelector("ul") || ul.children[itemIndex - 1].querySelector("ol"))
                setSelection(ul.children[itemIndex - 1].lastElementChild.lastElementChild.firstChild, -1)
            else
                setSelection(ul.children[itemIndex - 1].lastChild, -1)
        }
    }
    
    if (e.key == "Enter" && !editorMenu.classList.contains("active")){
        e.preventDefault()

        if (e.target.textContent.length == 0){
            ul.removeChild(e.target)

            if (ul.parentElement.localName == "li"){
                let li = document.createElement("li")

                ul.parentElement.parentElement.insertBefore(li, ul.parentElement.nextSibling)
                setTimeout(() => {
                    li.className = "list-item is-empty"

                    li.setAttribute("contenteditable", "true")

                    li.addEventListener("keydown", listUpdating)

                    setSelection(li)
                }, 0)

                setSelection(li)
            }
            else
                setSelection(currentElement)
        }
        else if (e.target.textContent.length > 0 && !e.target.querySelector("ul")){
            let offset = window.getSelection().anchorOffset

            let li = document.createElement("li")

            li.setAttribute("contenteditable", "true")

            ul.insertBefore(li, e.target.nextSibling)
            
            if (offset > 0 && offset < e.target.textContent.length - 1){
                let text = e.target.textContent
                e.target.textContent = text.substring(0, offset)
                li.textContent = text.substring(offset)
                setSelection(li, 1)
            }
            else
                setSelection(li)

            setTimeout(() => {
                li.className = "list-item is-empty"
                li.addEventListener("keydown", listUpdating)
            }, 0)
        }
    }
}

function createHr(){
    createDivElement()
    let hr = document.createElement("hr")
    div.appendChild(hr)
    div.setAttribute("contenteditable", "false")

    setTimeout(() => {
        hr.className = "separator"
        div.className = "separator-wrapper"
    }, 0)
}

function createElement(element){
    if (element == "table")
        createTable()
    else if (element == "header")
        createHeader()
    else if (element == "image")
        createImage()
    else if(element == "ul")
        createList()
    else if (element == "ol")
        createList(true)
    else if (element == "hr")
        createHr()
}

editorMenu.addEventListener("mouseover", (e) => {
    currentMenuItem = [...editorMenu.children].indexOf(e.target)
    setMenuItem()
})

editorMenu.addEventListener("click", (e) => {
    createElement(e.target.dataset.create)
})

editor.addEventListener("keydown", (e) => {
    if (e.key == "Backspace"){
        if (window.getSelection().anchorNode == document.querySelector(".post-header"))
            e.preventDefault()
    }
})

function createTable(){
    currentElement.textContent = ""

    let div = document.createElement("div")


    div.setAttribute("contenteditable", false)

    div.innerHTML = `
            <div class="settings-wrapper" contenteditable="false">
                <div class="settings-container">
                    <div class="settings-btn" id="add-left" title="Dodaj kolumnę po lewej stronie">
                        <img src="/notegram/imgs/add-left.svg" alt="">
                    </div>
                    <div class="settings-btn" id="add-right" title="Dodaj kolumnę po prawej stronie">
                        <img src="/notegram/imgs/add-right.svg" alt="">
                    </div>
                    <div class="settings-btn" id="del-col" title="Usuń kolumnę">
                        <img src="/notegram/imgs/delete-column.svg" alt="">
                    </div>
                </div>
                <!--  -->
                <div class="settings-separator">|</div>
                <!--  -->
                <div class="settings-container">
                    <div class="settings-btn" id="add-top" title="Dodaj wiersz u góry">
                        <img src="/notegram/imgs/add-top.svg" alt="">
                    </div>
                    <div class="settings-btn" id="add-bottom" title="Dodaj wiersz na dole">
                        <img src="/notegram/imgs/add-bottom.svg" alt="">
                    </div>
                    <div class="settings-btn" id="del-row" title="Usuń wiersz">
                        <img src="/notegram/imgs/delete-row.svg" alt="">
                    </div>
                    
                </div>
                <!-- -->
                <div class="settings-separator">|</div>
                <!-- -->
                <div class="settings-container">
                    <div class="node-remove" title="Usuń tabelę"></div>
                </div>
            </div>
        </div>
        <table class="table" contenteditable="false">
            <colgroup>
                <col>
                <col>
                <col>
            </colgroup>
            <tr class="table-item">
                <td class="table-data" contenteditable="true"></td>
                <td class="table-data" contenteditable="true"></td>
                <td class="table-data" contenteditable="true"></td>
            </tr>
            <tr class="table-item">
                <td class="table-data" contenteditable="true"></td>
                <td class="table-data" contenteditable="true"></td>
                <td class="table-data" contenteditable="true"></td>
            </tr>
            <tr class="table-item">
                <td class="table-data" contenteditable="true"></td>
                <td class="table-data" contenteditable="true"></td>
                <td class="table-data" contenteditable="true"></td>
            </tr>
        </table>
    `

    setTimeout(() => {
        div.className = "table-wrapper"
    }, 0)
    editor.insertBefore(div, currentElement)

    console.log(div)
    div.querySelector(".node-remove").addEventListener("click", () => div.remove())
    div.querySelector("#add-left").addEventListener("click", () => addColumnLeft())
    div.querySelector("#add-right").addEventListener("click", () => addColumnRight())
    div.querySelector("#del-col").addEventListener("click", () => removeColumn())
    div.querySelector("#add-top").addEventListener("click", () => addColumnTop())
    div.querySelector("#add-bottom").addEventListener("click", () => addColumnBottom())
    div.querySelector("#del-row").addEventListener("click", () => removeRow())
    
    let table = div.querySelector(".table")
    let tbody = table.querySelector("tbody")

    function findPosition(){
        if (window.getSelection().anchorNode.nodeName == "#text"){
            row = window.getSelection().anchorNode.parentElement.parentElement
            index = [...row.children].indexOf(window.getSelection().anchorNode.parentElement)
        }        
        else{
            row = window.getSelection().anchorNode.parentElement
            index = [...row.children].indexOf(window.getSelection().anchorNode)
        }

        return [row, index]
    }

    function addColumnLeft(){
        let [row, index] = findPosition()

        table.querySelectorAll("tr").forEach(tr => {
            console.log(index)
            let td = document.createElement("td")
            td.className = "table-data"
            td.setAttribute("contenteditable", true)
            tr.insertBefore(td, tr.children[index])
        })

        let col = document.createElement("col")
        table.querySelector("colgroup").insertBefore(col, table.querySelectorAll("colgroup > *")[index])

        if (index >= row.children.length - 1)
            row.lastElementChild.focus()
        else
            row.querySelectorAll("td")[index].focus()

    }

    function addColumnRight(){
        let [row, index] = findPosition()

        table.querySelectorAll("tr").forEach(tr => {
            let td = document.createElement("td")
            td.className = "table-data"
            td.setAttribute("contenteditable", true)
            if (index >= tr.children.length)
                tr.appendChild(td)
            else
                tr.insertBefore(td, tr.children[index].nextSibling)
        })

        let col = document.createElement("col")
        if (index >= table.querySelector("colgroup").children.length)
            table.querySelector("colgroup").appendChild(col)
        else
            table.querySelector("colgroup").insertBefore(col, table.querySelectorAll("colgroup > *")[index].nextSibling)

        if (index >= row.children.length - 1)
            row.lastElementChild.focus()
        else
            row.querySelectorAll("td")[index + 1].focus()
    }

    function removeColumn(){
        let [row, index] = findPosition()

        if (row.children.length < 2) return

        table.querySelector("colgroup").removeChild(table.querySelectorAll("colgroup > *")[index])

        table.querySelectorAll("tr").forEach(tr => {
            tr.removeChild(tr.children[index])
        })
        
        if (index >= row.children.length - 1)
            row.lastElementChild.focus()
        else
            row.querySelectorAll("td")[index].focus()
    }

    function addColumnTop(){
        let [row, index] = findPosition()

        console.log(row)
        let newRow = document.createElement("tr")

        newRow.className = "table-item"

        for (let i = 0; i < row.children.length; i++){
            let td = document.createElement("td")

            td.className = "table-data"
            td.setAttribute("contenteditable", true)

            newRow.appendChild(td)
        }

        if (tbody.querySelectorAll("tr")[[...tbody.children].indexOf(row)] == undefined){
            tbody.insertBefore(newRow, tbody.firstElementChild)
            newRow.children[index].focus()
        }
        else{
            tbody.insertBefore(newRow, row)
            newRow.children[index].focus()
        }
    }

    function addColumnBottom(){
        let [row, index] = findPosition()

        let newRow = document.createElement("tr")

        newRow.className = "table-item"

        for (let i = 0; i < row.children.length; i++){
            let td = document.createElement("td")

            td.className = "table-data"
            td.setAttribute("contenteditable", true)

            newRow.appendChild(td)
        }
        
        if (tbody.querySelectorAll("tr")[[...tbody.children].indexOf(row)] == undefined){
            tbody.insertBefore(newRow, tbody.lastElementChild)
            newRow.children[index].focus()
        }
        else{
            tbody.insertBefore(newRow, row.nextSibling)
            newRow.children[index].focus()
        }
    }

    function removeRow(){
        let [row, index] = findPosition()

        let rowIndex = [...tbody.children].indexOf(row)
        
        if (tbody.querySelector(`.${row.classList[0]}`) == null){
            tbody.removeChild(tbody.children[0])
            return
        }   
        else
            tbody.removeChild(row)

        if (rowIndex < tbody.children.length)
            tbody.children[rowIndex].children[index].focus()
        else if (rowIndex >= tbody.children.length)
            tbody.lastElementChild.children[index].focus()
        else
            tbody.firstElementChild.children[index].focus()
    }
}