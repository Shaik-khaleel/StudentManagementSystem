package com.sms.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import com.sms.dao.StudentDAO;
import com.sms.model.Student;

public class ViewStudentServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        StudentDAO dao = new StudentDAO();

        List<Student> students =
                dao.getAllStudents();

        request.setAttribute("students", students);

        request.getRequestDispatcher("students.jsp")
               .forward(request, response);
    }
}
