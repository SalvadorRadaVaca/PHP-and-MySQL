<!-- Contact -->
<section id="contact" class="four">
    <div class="container">

        <header>
            <h2>Contact</h2>
        </header>

        <p>Elementum sem parturient nulla quam placerat viverra
        mauris non cum elit tempus ullamcorper dolor. Libero rutrum ut lacinia
        donec curae mus. Eleifend id porttitor ac ultricies lobortis sem nunc
        orci ridiculus faucibus a consectetur. Porttitor curae mauris urna mi dolor.</p>

        <form method="post" action="#">
            <div class="row">
                <div class="col-6 col-12-mobile">
                    <input type="text" name="name" placeholder="Name" id="txtName" />
                </div>
                <div class="col-6 col-12-mobile">
                    <input type="text" name="email" placeholder="Email" id="txtEmail" />
                </div>
                <div class="col-12">
                    <textarea name="message" placeholder="Message" id="txtMessage"></textarea>
                </div>
                <div class="col-12">
                    <button type="button" id="btnSubmit">Send Message</button>
                </div>
            </div>
        </form>

    </div>
</section>

<script>
    (() => {
        let btnSubmit = window.document.getElementById("btnSubmit");
        btnSubmit.addEventListener('click', () => {
            let name = window.document.getElementById("txtName").value;
            let email = window.document.getElementById("txtEmail").value;
            let message = window.document.getElementById("txtMessage").value;
            
            fetch('email.php?name=' + name + '&email=' + email + '&message=' + message, {
                method: 'GET',
                headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
                }
            }).then(e => {
                alert(e);
            });
        });
    })();
</script>