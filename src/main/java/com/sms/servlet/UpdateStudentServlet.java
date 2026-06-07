package com.sms.servlet;

import java.io.IOException;

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
public class UpdateStudentServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(
                    request.getParameter("id"));

            String name =
                    request.getParameter("name");

            String email =
                    request.getParameter("email");

            String course =
                    request.getParameter("course");

            Part photoPart =
                    request.getPart("photo");

            StudentDAO dao =
                    new StudentDAO();

            Student student =
                    dao.getStudentById(id);

            if (student == null) {

                response.getWriter().println(
                        "<h2>Student Not Found</h2>");

                return;
            }

            student.setName(name);
            student.setEmail(email);
            student.setCourse(course);

            if (photoPart != null &&
                    photoPart.getSize() > 0) {

                byte[] imageBytes =
                        photoPart.getInputStream()
                                .readAllBytes();

                student.setPhoto(imageBytes);
            }

            boolean status =
                    dao.updateStudent(student);

            if (status) {

                response.sendRedirect(
                        "viewStudents");

            } else {

                response.getWriter().println(
                        "<h2>Update Failed</h2>");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h2>Error Updating Student</h2>");
        }
    }
}