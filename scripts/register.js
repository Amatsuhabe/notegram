let errors = new Set(["name", "surname", "password", "email", "username", "confirm"])
let timeout

let formField = document.querySelector("form")
let emailField = document.querySelector("input#email")
let usernameField = document.querySelector("input#username")

let passwordField = document.querySelector("input#password")
let confirmField = document.querySelector("input#confirm")

formField.addEventListener("submit", (event) => {
    event.preventDefault()
    console.log(errors)
    if (errors.size == 0)
        fetch("../php_scripts/register.php", {
            method: "post",
            body: new FormData(event.target)
        })
        .then(response => response.json())
        .then(errors => {
            errors.forEach(error => {
                addIncorrect(document.querySelector(`#${error}`))
            })         
        })
    else
        errors.forEach(error => {
            addIncorrect(document.querySelector(`#${error}`))
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

passwordField.addEventListener("input", (event) => {
    if (event.target.value.length > 0){
        addCorrect(event.target)
    }
    else{
        addIncorrect(event.target)
    }

    if (event.target.value != confirmField.value)
        addIncorrect(confirmField)
    else
        addCorrect(confirmField)

    addFieldCheck(passwordField, "password")
})

confirmField.addEventListener("input", (event) => {
    if (event.target.value != passwordField.value)
        addIncorrect(event.target)
    else
        addCorrect(event.target)
})

usernameField.addEventListener("input", (event) => { 
    let value = event.target.value

    let form = new FormData()

    if (value.length < 2 || value.length > 16){
        addIncorrect(event.target)
        return 0
    }
    else
        addCorrect(event.target)

    addFieldCheck(usernameField, "username")
})

emailField.addEventListener("input", (event) => {
    let value = event.target.value
    if (value.match(/@[a-z]+\.[a-z]+/i) != null){
        addCorrect(event.target) 
        
        addFieldCheck(emailField, "email")
    }
    else{
        addIncorrect(event.target)
        emailField.parentElement.dataset.error = ""
    }

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

function addFieldCheck(field, dataName){
    clearTimeout(timeout)
    let value = field.value
    timeout = setTimeout(() => {
        field.classList.add("waiting")
        let form = new FormData()
        
        form.append(`${dataName}`, value)
        
        passwordTimeout = setTimeout(() => {
            fetch(`../php_scripts/check_${dataName}.php`, {
                method: "POST",
                body: form
            })
            .then(response => response.json())
            .then(data => {
                console.log(data)
                
                field.parentElement.dataset.error = data.message

                if (!data.isAvailable)                    
                    addIncorrect(field)
                    
                field.classList.remove("waiting")
            })
        }, 250)
    })
}