package department.servlet;

import department.data.model.Department;
import department.service.CompanyService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/updateDepartments")
public class UpdateDepartmentServlet extends HttpServlet {
    private final CompanyService service = new CompanyService();

    public UpdateDepartmentServlet() throws SQLException {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String departmentIdStr = req.getParameter("departmentId");

        if (departmentIdStr != null) {
            int departmentId = Integer.parseInt(departmentIdStr);

            try {
                Department department = service.getDepartment(departmentId);

                req.setAttribute("department", department);
                req.setAttribute("departmentId", departmentId);

                req.getRequestDispatcher("/WEB-INF/update-department.jsp").forward(req, resp);
            } catch (SQLException e) {
                e.printStackTrace();
                resp.getWriter().write("Error occurred while retrieving department data.");
            }
        } else {
            resp.getWriter().write("Department ID not provided.");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int departmentId = Integer.parseInt(request.getParameter("departmentId"));
        String name = request.getParameter("name");

        try {
            service.editDepartment(new Department(departmentId, name));
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error occurred while updating department data.");
            return;
        }

        response.sendRedirect(request.getContextPath() + "/department");
    }
}
