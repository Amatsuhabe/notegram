let userAvatar = document.querySelector(".user-avatar")
let menu = document.querySelector(".menu-wrapper")

document.addEventListener("click", (e) => {
    console.log(e.target)
    if ([e.target, e.target.parentElement].includes(userAvatar))
        menu.classList.toggle("hidden")
    else if (![...menu.querySelectorAll("*"), menu].includes(e.target))
        menu.classList.add("hidden")
    
})