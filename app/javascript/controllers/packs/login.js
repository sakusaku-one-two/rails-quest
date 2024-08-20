document.addEventListener("DOMContentLoaded",function() {
    const loginForm = document.getElementById("login-form");
    if (loginForm) {
        loginForm.addEventListener("submit",async (event) =>{
            event.preventDefault();
            const form = event.target;
            const formData = new FormData(form);
            const data = {
                email: formData.get("user[email]"),
                password: formData.get("user[password]")
            };

            
                await fetch(form.action,{
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        "Accept": "application/json"
                    },
                    body: JSON.stringify(data)
                }).then(response => {
                    if (!response.ok){
                        throw new Error('認証失敗しました。');
                    }
                    return response.json();
                }).then(data => {
                    document.cookie = `jwt=${data.jwt}; path=/; HttpOnly`;
                    window.location.href = "/home";
                }).catch(error => {
                    alert("ログイン失敗しました。再度やり直してください。")
                });

            
        })
    }
})