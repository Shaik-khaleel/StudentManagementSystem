package com.sms.servlet;

import java.io.IOException;
import java.io.InputStream;

import com.sms.dao.StudentDAO;
import com.sms.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 5 * 1024 * 1024,
        maxRequestSize = 10 * 1024 * 1024
)
public class AddStudentServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        Part photoPart = request.getPart("photo");

        byte[] imageBytes = null;

        if (photoPart != null &&
                photoPart.getSize() > 0) {

            try (InputStream input =
                         photoPart.getInputStream()) {

                imageBytes = input.readAllBytes();
            }
        }

        Student student = new Student();

        student.setName(name);
        student.setEmail(email);
        student.setCourse(course);
        student.setPhoto(imageBytes);

        StudentDAO dao = new StudentDAO();

        if (dao.addStudent(student)) {

            response.sendRedirect("viewStudents");

        } else {

            response.getWriter().println(
                    "<h2>Failed To Add Student</h2>");
        }
    }
}