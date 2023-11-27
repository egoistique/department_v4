package department.servlet;

import department.data.model.Employee;
import department.service.CompanyService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/updateEmployees")
public class UpdateEmployeeServlet extends HttpServlet {

    private final CompanyService service = new CompanyService();

    public UpdateEmployeeServlet() throws SQLException {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String employeeIdStr = req.getParameter("employeeId");

        if (employeeIdStr != null) {
            int employeeId = Integer.parseInt(employeeIdStr);

            try {
                Employee employee = service.getEmployee(employeeId);

                req.setAttribute("employee", employee);
                req.setAttribute("employeeId", employeeId);

                req.getRequestDispatcher("/WEB-INF/update-employee.jsp").forward(req, resp);
            } catch (SQLException e) {
                e.printStackTrace();
                resp.getWriter().write("Error occurred while retrieving employee data.");
            }
        } else {
            resp.getWriter().write("Employee ID not provided.");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        double salary = Double.parseDouble(request.getParameter("salary"));
        int departmentId = Integer.parseInt(request.getParameter("departmentId"));

        try {
            service.editEmployee(new Employee(employeeId, name, age, salary, departmentId));
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error occurred while updating employee data.");
            return;
        }

        response.sendRedirect(request.getContextPath() + "/employee");
    }
}

