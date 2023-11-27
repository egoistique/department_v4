package department.servlet;

import department.data.model.Department;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/departments")
public class DepartmentServlet extends HttpServlet {

    private final CompanyService service = new CompanyService();

    public DepartmentServlet() throws SQLException {
    }

    public void init(ServletConfig servletConfig) {
        try {
            super.init(servletConfig);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if ("delete".equals(req.getParameter("action"))) {
            String departmentIdStr = req.getParameter("departmentId");
            if (departmentIdStr != null) {
                try {
                    int departmentId = Integer.parseInt(departmentIdStr);
                    service.deleteDepartment(departmentId);
                    resp.sendRedirect(req.getContextPath() + "/department");
                    return;
                } catch (SQLException e) {
                    e.printStackTrace();
                    resp.getWriter().write("Error occurred while deleting department.");
                    return;
                }
            }
        }

        if (req.getParameter("action") != null && req.getParameter("action").equals("new")) {
            req.getRequestDispatcher("/WEB-INF/create-department.jsp").forward(req, resp);
        } else {
            List<Department> departments;
            Map<Integer, List<Employee>> employeesMap = new HashMap<>();
            try {
                departments = service.getAllDepartments();
                for (Department department : departments) {
                    List<Employee> employees = service.getEmployeesFromDepartment(department.getId());
                    employeesMap.put(department.getId(), employees);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                resp.getWriter().write("Error occurred while retrieving departments.");
                return;
            }

            req.setAttribute("departments", departments);
            req.setAttribute("employeesMap", employeesMap);
            req.getRequestDispatcher("/WEB-INF/department-list.jsp").forward(req, resp);

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        try {
            service.addDepartment(name);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error occurred while creating department.");
            return;
        }

        response.sendRedirect(request.getContextPath() + "/department");
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String departmentIdStr = request.getParameter("departmentId");

        if (departmentIdStr != null) {
            try {
                int departmentId = Integer.parseInt(departmentIdStr);
                service.deleteDepartment(departmentId);
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().write("Error occurred while deleting department.");
                return;
            }

            response.sendRedirect(request.getContextPath() + "/department");
        } else {
            response.getWriter().write("No department ID provided.");
        }
    }

    @Override
    public void destroy() {
        service.exit();
        super.destroy();
    }
}

