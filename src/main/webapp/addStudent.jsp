<%@ page language="java" %>

<!DOCTYPE html>
<html>
<head>

<title>Add Student</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Segoe UI;
}

body{
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:linear-gradient(
135deg,
#667eea,
#764ba2);
}

.card{

width:420px;
background:white;
padding:30px;
border-radius:20px;

box-shadow:
0 10px 30px rgba(0,0,0,.3);

animation:fade .8s ease;
}

h2{
text-align:center;
margin-bottom:20px;
}

input{

width:100%;
padding:12px;
margin:10px 0;

border:1px solid #ddd;
border-radius:10px;
}

button{

width:100%;
padding:14px;

background:#667eea;
color:white;

border:none;
border-radius:10px;

cursor:pointer;
font-size:16px;
}

button:hover{

background:#4f46e5;
}

@keyframes fade{

from{
opacity:0;
transform:translateY(40px);
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

<h2>Add Student</h2>

<form action="addStudent"
      method="post"
      enctype="multipart/form-data">

<input
type="text"
name="name"
placeholder="Student Name"
required>

<input
type="email"
name="email"
placeholder="Email"
required>

<label>Student Photo</label>

<input
type="file"
name="photo"
accept="image/*"
required>


      
<input
type="text"
name="course"
placeholder="Course"
required>

<button type="submit">

Save Student

</button>

</form>

</div>

</body>
</html>