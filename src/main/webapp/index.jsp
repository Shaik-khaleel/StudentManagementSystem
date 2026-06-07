<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management System</title>

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
    background:linear-gradient(135deg,#141E30,#243B55);
    overflow:hidden;
}

.container{
    width:700px;
    padding:40px;
    background:rgba(255,255,255,0.12);
    backdrop-filter:blur(15px);
    border-radius:25px;
    text-align:center;
    box-shadow:0 8px 32px rgba(0,0,0,0.3);
    animation:slideUp 1s ease;
}

h1{
    color:white;
    margin-bottom:15px;
    font-size:38px;
}

p{
    color:#ddd;
    margin-bottom:30px;
}

.btn-group{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:20px;
}

.btn{
    padding:18px;
    text-decoration:none;
    color:white;
    font-size:18px;
    border-radius:12px;
    transition:0.4s;
    font-weight:bold;
}

.create{
    background:#00c853;
}

.read{
    background:#2196f3;
}

.update{
    background:#ff9800;
}

.delete{
    background:#f44336;
}

.btn:hover{
    transform:translateY(-5px);
    box-shadow:0 10px 20px rgba(0,0,0,0.3);
}

.circle{
    position:absolute;
    border-radius:50%;
    background:rgba(255,255,255,0.08);
    animation:float 8s infinite ease-in-out;
}

.circle:nth-child(1){
    width:200px;
    height:200px;
    top:10%;
    left:5%;
}

.circle:nth-child(2){
    width:250px;
    height:250px;
    bottom:5%;
    right:5%;
}

@keyframes slideUp{
    from{
        opacity:0;
        transform:translateY(50px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}

@keyframes float{
    0%{
        transform:translateY(0px);
    }
    50%{
        transform:translateY(-30px);
    }
    100%{
        transform:translateY(0px);
    }
}

.footer{
    margin-top:25px;
    color:white;
    font-size:14px;
}

</style>

</head>

<body>

<div class="circle"></div>
<div class="circle"></div>

<div class="container">

<h1>Student Management System</h1>

<p>
Manage Students using CRUD Operations
</p>

<div class="btn-group">

<a href="addStudent.jsp" class="btn create">
➕ Create Student
</a>

<a href="viewStudents" class="btn read">
📋 View Students
</a>

<a href="viewStudents" class="btn update">
✏️ Update Student
</a>

<a href="viewStudents" class="btn delete">
🗑 Delete Student
</a>

</div>

<div class="footer">

</div>

</div>

</body>
</html>