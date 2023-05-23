let commentField = document.querySelector(".comment-field")
let publicateBtn = document.querySelector(".comment-field-wrapper .publicate-btn")


function uploadComment(){
    let form = new FormData()
    form.append("comment", commentField.value)
    form.append("post_id", window.location.search.split("id=")[1])
    fetch("../php_scripts/upload_comment.php", {
        method: "POST",
        body: form
    })
}

publicateBtn.addEventListener("click", uploadComment)


commentField.addEventListener("input", (e) => {
    if (e.target.value.length == 0)
        publicateBtn.setAttribute("disabled", "")
    else
        publicateBtn.removeAttribute("disabled")

})