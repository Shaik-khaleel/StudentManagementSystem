<%@ page import="java.util.List" %>
<%@ page import="com.sms.model.Student" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student List</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    min-height:100vh;
    background:linear-gradient(135deg,#141E30,#243B55);
    padding:40px;
}

.container{
    max-width:1200px;
    margin:auto;
    background:rgba(255,255,255,0.12);
    backdrop-filter:blur(15px);
    border-radius:20px;
    padding:30px;
    box-shadow:0 8px 32px rgba(0,0,0,0.3);
    animation:fadeIn 1s ease;
}

h1{
    text-align:center;
    color:white;
    margin-bottom:25px;
}

.top-bar{
    display:flex;
    justify-content:space-between;
    margin-bottom:20px;
}

.btn{
    text-decoration:none;
    padding:12px 20px;
    border-radius:10px;
    color:white;
    font-weight:bold;
    transition:0.3s;
}

.add-btn{
    background:#00c853;
}

.home-btn{
    background:#2196f3;
}

.btn:hover{
    transform:translateY(-3px);
}

table{
    width:100%;
    border-collapse:collapse;
    overflow:hidden;
    border-radius:15px;
}

th{
    background:#1e88e5;
    color:white;
    padding:15px;
}

td{
    background:white;
    padding:15px;
    text-align:center;
    border-bottom:1px solid #eee;
}

tr:hover td{
    background:#f5f5f5;
}

.edit{
    background:#ff9800;
    color:white;
    padding:8px 14px;
    border-radius:8px;
    text-decoration:none;
    margin-right:5px;
}

.delete{
    background:#f44336;
    color:white;
    padding:8px 14px;
    border-radius:8px;
    text-decoration:none;
}

.edit:hover{
    background:#fb8c00;
}

.delete:hover{
    background:#d32f2f;
}

.no-data{
    text-align:center;
    color:white;
    margin-top:20px;
    font-size:20px;
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

<div class="container">

    <h1>Student Management System</h1>

    <div class="top-bar">

        <a href="index.jsp" class="btn home-btn">
            Home
        </a>

        <a href="addStudent.jsp" class="btn add-btn">
            Add Student
        </a>

    </div>

    <table>

        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Course</th>
            <th>Photo</th>
            <th>Actions</th>
        </tr>

        <%
        List<Student> students =
                (List<Student>)request.getAttribute("students");

        if(students != null && !students.isEmpty()){

            for(Student s : students){
        %>

        <tr>

            <td><%=s.getId()%></td>

            <td><%=s.getName()%></td>

            <td><%=s.getEmail()%></td>

            <td><%=s.getCourse()%></td>
            <td>

<td>

<img
src="image?id=<%=s.getId()%>"
width="80"
height="80"
alt="Student Image"
style="
border-radius:50%;
object-fit:cover;
border:2px solid #2196F3;">

</td>

            <td>

                <a class="edit"
                   href="editStudent?id=<%=s.getId()%>">
                   Edit
                </a>

                <a class="delete"
                   href="deleteStudent?id=<%=s.getId()%>"
                   onclick="return confirm('Are you sure you want to delete this student?')">
                   Delete
                </a>

            </td>

        </tr>

        <%
            }
        }else{
        %>

        <tr>
            <td colspan="5">
                No Students Found
            </td>
        </tr>

        <%
        }
        %>

    </table>

</div>

</body>
</html>