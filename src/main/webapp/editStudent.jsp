<%@ page import="com.sms.model.Student" %>

<%
Student s = (Student) request.getAttribute("student");

if (s == null) {
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Not Found</title>

<style>
body{
    margin:0;
    font-family:Segoe UI,sans-serif;
    background:linear-gradient(135deg,#141E30,#243B55);
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.card{
    background:white;
    padding:30px;
    border-radius:15px;
    text-align:center;
    box-shadow:0 10px 25px rgba(0,0,0,.3);
}

a{
    display:inline-block;
    margin-top:15px;
    text-decoration:none;
    background:#2196F3;
    color:white;
    padding:10px 20px;
    border-radius:8px;
}
</style>

</head>
<body>

<div class="card">
    <h2>Student Not Found</h2>

    <a href="viewStudents">
        Back To Student List
    </a>
</div>

</body>
</html>

<%
return;
}
%>

<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#4facfe,#00f2fe);
}

.card{
    width:500px;
    background:white;
    padding:35px;
    border-radius:20px;
    box-shadow:0 10px 30px rgba(0,0,0,.25);
    animation:fadeIn .8s ease;
}

h2{
    text-align:center;
    margin-bottom:25px;
    color:#333;
}

label{
    font-weight:bold;
    color:#444;
}

input{
    width:100%;
    padding:12px;
    margin-top:8px;
    margin-bottom:15px;
    border:1px solid #ccc;
    border-radius:10px;
    outline:none;
}

input:focus{
    border-color:#00bcd4;
}

button{
    width:100%;
    padding:14px;
    background:#4CAF50;
    color:white;
    border:none;
    border-radius:10px;
    font-size:16px;
    cursor:pointer;
}

button:hover{
    background:#43a047;
}

.back{
    display:block;
    text-align:center;
    margin-top:15px;
    text-decoration:none;
    color:#2196F3;
}

@keyframes fadeIn{
    from{
        opacity:0;
        transform:translateY(30px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}

</style>

</head>

<body>

<div class="card">

<h2>Update Student</h2>

<form action="updateStudent"
      method="post"
      enctype="multipart/form-data">

<input
type="hidden"
name="id"
value="<%= s.getId() %>">

<label>Name</label>

<input
type="text"
name="name"
value="<%= s.getName() %>"
required>

<label>Email</label>

<input
type="email"
name="email"
value="<%= s.getEmail() %>"
required>

<label>Course</label>

<input
type="text"
name="course"
value="<%= s.getCourse() %>"
required>

<label>Upload New Photo</label>

<input
type="file"
name="photo"
accept="image/*">

<p>
Leave empty if you don't want to change the image.
</p>

<button type="submit">
Update Student
</button>

</form>

<a href="viewStudents" class="back">
 Back To Student List
</a>

</div>

</body>
</html>