let commentField = document.querySelector(".comment-field")
let publicateBtn = document.querySelector(".comment-field-wrapper .publicate-btn")
let replyBtns = document.querySelectorAll(".reply-btn")
let likeBtns = document.querySelectorAll(".like-btn")
let repliesWrapper = document.querySelector(".replies-wrapper")

const post_id = window.location.search.split("id=")[1]

function uploadComment(){
    if (commentField.value.length == 0) return

    let form = new FormData()
    form.append("comment", commentField.value)
    form.append("post_id", post_id)
    fetch("../php_scripts/upload_comment.php", {
        method: "POST",
        body: form
    })
    .then(response => response.text())
    .then(data => {
        if (data)
            window.location.reload()
    })
}

commentField.addEventListener("input", (e) => {
    if (e.target.value.length == 0){
        publicateBtn.setAttribute("disabled", "")
        publicateBtn.removeEventListener("click", uploadComment)
    }
    else{
        publicateBtn.removeAttribute("disabled")
        publicateBtn.addEventListener("click", uploadComment)
    }

})

function uploadReply(value, parent){
    if (value.length == 0) return
    console.log(parent)

    let comment_id = parent.querySelector("input[type='hidden']").value
    let form = new FormData()

    form.append("comment", value)
    form.append("comment_id", comment_id)
    form.append("post_id", post_id)
    
    fetch("../php_scripts/upload_reply.php", {
        method: "POST",
        body: form
    })
    .then(response => response.text())
    .then(data => {
        if (data) 
            window.location.reload()
    })
}

function addReplyField(){
    let replyWrapper = document.createElement("div")
    let repliesParent = this.closest(".comment-wrapper")

    replyWrapper.className = "comment-field-wrapper"

    replyWrapper.innerHTML = 
    `
        <div class="comment-field-container">
            <div class="user-avatar">
                <img src="<?php echo "/notegram/avatars/{$result['avatar']}"?>" alt="">
            </div>
            <textarea name="" class="comment-field" id="" rows="2"></textarea>
            </div>
        <div class="publicate-btn btn" disabled>Opublikować</div>
    `
    let replyBtn = replyWrapper.querySelector(".publicate-btn")
    let replyField = replyWrapper.querySelector("textarea")

    replyField.addEventListener("input", () => {
        if (replyField.value.length == 0){
            replyBtn.setAttribute("disabled", "")
            replyBtn.onclick = null
        }
        else{
            replyBtn.removeAttribute("disabled")
            replyBtn.onclick = () => {
                uploadReply(replyField.value, repliesParent)
            }
        }
    })
    console.log(repliesParent)
    replyBtn.onclick = () => {
        uploadReply(replyField.value, repliesParent)
    }

    repliesParent.appendChild(replyWrapper)
}

replyBtns.forEach(replyBtn => {
    replyBtn.addEventListener("click", addReplyField)
})