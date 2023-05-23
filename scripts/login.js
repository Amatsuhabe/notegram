let username = document.querySelector("#username")
let password = document.querySelector("#password")

let errorField = document.querySelector(".error-field")

document.querySelector("form").addEventListener("submit", (event) => {
    event.preventDefault()

    // addCorrect(username, password)

    fetch("../php_scripts/login.php", {
        method: "post",
        body: new FormData(event.target)
    }).then(response => response.json()).then(data => {
        console.log(data)
        if (data == 1)
            window.location.href = "/notegram/index.php"
        else if (data.error == "login"){
            addIncorrect(username, password)
            errorField.textContent = data.context
        }
        else{
            addCorrect(username)
            addIncorrect(password)
            errorField.textContent = data.context
        }
    })

})

function addCorrect(...elements){
    elements.forEach(element => {
        element.classList.remove("incorrect")
        element.classList.add("correct")
    })
}

function addIncorrect(...elements){
    elements.forEach(element => {
        element.classList.remove("correct")
        element.classList.add("incorrect")
    })
}