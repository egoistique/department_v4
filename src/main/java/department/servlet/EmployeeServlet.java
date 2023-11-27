package department.servlet;

import department.data.model.Employee;
import department.service.CompanyService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/employees")
public class EmployeeServlet extends HttpServlet {
    private final CompanyService service = new CompanyService();

    public EmployeeServlet() throws SQLException {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if ("delete".equals(req.getParameter("action"))) {
            String employeeIdStr = req.getParameter("employeeId");
            if (employeeIdStr != null) {
                try {
                    int employeeId = Integer.parseInt(employeeIdStr);
                    service.removeEmployee(employeeId);
                    resp.sendRedirect(req.getContextPath() + "/employee");
                    return;
                } catch (SQLException e) {
                    e.printStackTrace();
                    resp.getWriter().write("Error occurred while deleting employee.");
                    return;
                }
            }
        }

        if (req.getParameter("action") != null && req.getParameter("action").equals("new")) {
            req.getRequestDispatcher("/WEB-INF/create-employee.jsp").forward(req, resp);
        } else {
            List<Employee> employees;
            try {
                employees = service.getAllEmployees();
            } catch (SQLException e) {
                e.printStackTrace();
                resp.getWriter().write("Error occurred while retrieving employees.");
                return;
            }

            req.setAttribute("employees", employees);
            req.getRequestDispatcher("/WEB-INF/employees.jsp").forward(req, resp);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        double salary = Double.parseDouble(request.getParameter("salary"));
        String department = request.getParameter("department");

        try {
            service.addEmployeeToDepartment(department, name, age, salary);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error occurred while creating employee.");
            return;
        }
        response.sendRedirect(request.getContextPath() + "/employee");
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeIdStr = request.getParameter("employeeId");

        if (employeeIdStr != null) {
            try {
                int employeeId = Integer.parseInt(employeeIdStr);
                service.removeEmployee(employeeId);
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().write("Error occurred while deleting employee.");
                return;
            }

            response.sendRedirect(request.getContextPath() + "/employee");
        } else {
            response.getWriter().write("No employee ID provided.");
        }
    }

    @Override
    public void destroy() {
        service.exit();
        super.destroy();
    }
}


