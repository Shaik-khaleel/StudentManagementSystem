package com.sms.servlet;

import java.io.IOException;

import com.sms.dao.StudentDAO;
import com.sms.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ImageServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(
                    request.getParameter("id"));

            StudentDAO dao = new StudentDAO();

            Student student =
                    dao.getStudentById(id);

            if (student != null &&
                    student.getPhoto() != null) {

                response.setContentType("image/*");

                response.getOutputStream()
                        .write(student.getPhoto());

            } else {

                response.getWriter()
                        .println("No Image Found");
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}