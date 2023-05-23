let errors = new Set(["name", "surname", "password", "email", "username", "confirm"])
let usernameTimeout

document.querySelector("form").addEventListener("submit", (event) => {
    event.preventDefault()
    console.log(errors)
    if (errors.size == 0)
        fetch("../php_scripts/register.php", {
            method: "post",
            body: new FormData(event.target)
        })
        .then(response => response.json())
        .then(data => {
            if (data.error == "username")
                addIncorrect(document.querySelector("#username"))
            else if (data.error = "email"){
                addIncorrect(document.querySelector("#email"))
            }
            else
                window.location.href = "/notegram/"
        })
    else
        errors.forEach(error => {
            document.querySelector(`#${error}`).classList.add("incorrect")
        })
})

document.querySelectorAll(".input-container:nth-child(1)").forEach(input => {
    input.addEventListener("input", (event) => {
        if (event.target.value.length < 2 || event.target.value.length > 20){
            addIncorrect(event.target)
        }
        else{
            addCorrect(event.target)
        }
    })
})

document.querySelector('input[name="password"]').addEventListener("input", (event) => {
    if (event.target.value.length > 0){
        addCorrect(event.target)
    }
    else{
        addIncorrect(event.target)
    }

    if (event.target.value != document.querySelector('#confirm').value)
        addIncorrect(document.querySelector('#confirm'))
    else
        addCorrect(document.querySelector('#confirm'))
})

document.querySelector('#confirm').addEventListener("input", (event) => {
    if (event.target.value != document.querySelector('input[type="password"]').value)
        addIncorrect(event.target)
    else
        addCorrect(event.target)
})

document.querySelector('input[name="username"]').addEventListener("input", (event) => { 
    let value = event.target.value

    let form = new FormData()

    if (value.length < 2 || value.length > 16){
        addIncorrect(event.target)
        return 0
    }
    else
        addCorrect(event.target)

    clearTimeout(usernameTimeout)
    usernameTimeout = setTimeout(() => {
        form.append("username", value)
        
        fetch("../php_scripts/check_user.php", {
            method: "post",
            body: form
        })
        .then(response => response.json())
        .then(data => {
            if (data.isAvailable)
                addCorrect(event.target)
            else
                addIncorrect(event.target)
        })    
    }, 500)
})

document.querySelector('input[name="email"]').addEventListener("input", (event) => {
    let value = event.target.value
    console.log(value.match(/@[a-z]+\.[a-z]+/i))
    if (value.match(/@[a-z]+\.[a-z]+/i) != null)
        addCorrect(event.target)
    else
        addIncorrect(event.target)

})

function addCorrect(...elements){
    elements.forEach(element => {
        element.classList.remove("incorrect")
        element.classList.add("correct")
        errors.delete(element.getAttribute("id"))
    })
}

function addIncorrect(...elements){
    elements.forEach(element => {
        element.classList.remove("correct")
        element.classList.add("incorrect")
        errors.add(element.getAttribute("id"))
    })
}