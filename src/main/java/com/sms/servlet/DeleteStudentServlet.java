package com.sms.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import com.sms.dao.StudentDAO;

public class DeleteStudentServlet
extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id =
        Integer.parseInt(
        request.getParameter("id"));

        StudentDAO dao =
                new StudentDAO();

        dao.deleteStudent(id);

        response.sendRedirect(
                "viewStudents");
    }
}