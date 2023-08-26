<!DOCTYPE html>
<html>
<head>
        <link rel="stylesheet" type="text/css" href="buttbimg.css">
        <link rel="stylesheet" type="text/css" href="dropdown.css">
	<title>User Feedback</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
</head>
<body>
    <% 
        String name = (String) session.getAttribute("user");
        session.setAttribute("user", name);
    %>
    <center>
        <h4> Scan the QR Code to select a restaurant </h4>
    <video id="preview"></video>
    <form name="feed" method="post" action="store.jsp">
        <div>Restaurant selected: <span name="makevisible" id="makevisible"> </span> </div>
        <input type="hidden" name="restname"/>
        <p> On a scale of 1 (least) to 5 (highest) rate the restaurant in terms of hygiene</p>
            <p>
                1. Quality of food
                <select name="food" id="food">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </p>
            <p>
                2. Potable water
                <select name="water" id="water">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </p>
            <p>
                3. Hand washing and Sanitation facilities
                <select name="sanitation" id="sanitation">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </p>
            <p>
                4. Personal hygiene of food providers
                <select name="phygiene" id="phygiene">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </p>
            <p>
                5. Rodents or Insects encounter
                <select name="insect" id="insect">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </p>
            <p>
                6. Open kitchen or kitchen visits
                <select name="kitchen" id="kitchen">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </p>
            <p>
                Miscellaneous: <br>
                <textarea name="miscellaneous" placeholder="Other feedback" rows="5" cols="50" name="other"></textarea>
            </p>
            <p>  <button class="modern" style="height:30px;width:150px;border-radius:20px/60px;background-image:linear-gradient(to right, rgba(188,98,223,1), rgba(94,40,253,1));color:white;"> Submit </button> </p>
    </form>
    </center>
    <script type="text/javascript">
      var restaurant;
      let scanner = new Instascan.Scanner({ video: document.getElementById('preview') });
      scanner.addListener('scan', function (content) {
        restaurant=content;
        document.getElementById("makevisible").innerHTML=restaurant;
        document.feed.restname.value=restaurant;
      });
      Instascan.Camera.getCameras().then(function (cameras) {
        if (cameras.length > 0) {
          scanner.start(cameras[0]);
        } else {
          console.error('No cameras found.');
        }
      }).catch(function (e) {
        console.error(e);
      });
    </script>
</body>
</html>