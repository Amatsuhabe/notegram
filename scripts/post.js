let commentField = document.querySelector(".comment-field")
let publicateBtn = document.querySelector(".comment-field-wrapper .publicate-btn")
let replyBtns = document.querySelectorAll(".reply-btn")
let likeBtns = document.querySelectorAll(".like-btn")
let repliesWrapper = document.querySelector(".replies-wrapper")

let avatar = document.querySelector(".comment-field-wrapper .comment-field-container img").src

const post_id = new URLSearchParams(window.location.search).get("id")

function uploadComment(comment, comment_id = null){
    if (comment.length == 0) return

    let form = new FormData()

    form.append("comment", comment)
    form.append("post_id", post_id)
    form.append("comment_id", comment_id)

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
        publicateBtn.onclick = null
    }
    else{
        publicateBtn.removeAttribute("disabled")
        publicateBtn.onclick = () => uploadComment(commentField.value)
    }

})

function addReplyField(){
    let replyFieldWrapper = document.createElement("div")
    let replyParent = this.closest(".comment-wrapper")
    let replyBtn = replyParent.querySelector(".reply-btn")
    let comment_id = replyParent.querySelector("input[type='hidden']").value

    replyFieldWrapper.className = "comment-field-wrapper"

    replyFieldWrapper.innerHTML = 
    `
        <div class="comment-field-container">
            <div class="user-avatar">
                <img src="${avatar}" alt="">
            </div>
            <textarea name="" class="comment-field" id="" rows="2"></textarea>
            </div>
        <div class="publicate-btn btn" disabled>Opublikować</div>
    `
    let replyPublicateBtn = replyFieldWrapper.querySelector(".publicate-btn")
    let replyField = replyFieldWrapper.querySelector("textarea")

    replyField.addEventListener("input", () => {
        if (replyField.value.length == 0){
            replyPublicateBtn.setAttribute("disabled", "")
            replyPublicateBtn.onclick = null
        }
        else{
            replyPublicateBtn.removeAttribute("disabled")
            replyPublicateBtn.onclick = () => uploadComment(replyField.value, comment_id)
        }
    })

    replyPublicateBtn.onclick = () => uploadComment(replyField.value, comment_id)

    let repliesWrapper = replyParent.querySelector(".replies-wrapper")

    replyParent.insertBefore(replyFieldWrapper, repliesWrapper)

    setTimeout(() => {
        document.onclick = (e) => {
            if (![...replyFieldWrapper.querySelectorAll("*"), replyFieldWrapper].includes(e.target)){
                replyFieldWrapper.remove()
                document.onclick = null
            }
        }
    }, 0)
}

replyBtns.forEach(replyBtn => {
    replyBtn.addEventListener("click", addReplyField)
})

likeBtns.forEach(likeBtn => {
    likeBtn.addEventListener("click", () => {
        let comment_id = likeBtn.closest(".comment-wrapper").querySelector("input").value
        console.log("123")
        let form = new FormData()

        form.append("comment_id", comment_id)
        form.append("post_id", post_id)

        fetch("../php_scripts/do_like.php", {
            method: "POST",
            body: form
        })
        .then(window.location.reload())
    })
})