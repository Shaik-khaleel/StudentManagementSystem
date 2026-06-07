package com.sms.servlet;

import java.io.IOException;

import com.sms.dao.StudentDAO;
import com.sms.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditStudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(
                request.getParameter("id"));

        StudentDAO dao = new StudentDAO();

        Student student = dao.getStudentById(id);

        if(student == null) {

            response.getWriter().println(
                    "<h2>Student Not Found</h2>");

            return;
        }

        request.setAttribute(
                "student",
                student);

        request.getRequestDispatcher(
                "/editStudent.jsp")
                .forward(request, response);
    }
}