document.addEventListener('turbo:load', function() {

    setTimeout(function() {
        const fadeout = document.querySelector("#fadeout")
        if(fadeout) {
            fadeout.classList.add("hidden")
        }
    }, 3000)
})
