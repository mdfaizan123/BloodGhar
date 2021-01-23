<form>
    <input id="myInput" placeholder="Some text.." value="">
    <input type="submit" id="myBtn" value="Submit">
</form>

<script>
var input = document.getElementById("myInput");
input.addEventListener("keyup", function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
        document.getElementById("myBtn").click();
    }
});
</script>