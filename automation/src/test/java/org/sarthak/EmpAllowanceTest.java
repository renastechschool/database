package org.sarthak;

import org.commons.DBConnector;
import org.junit.*;

import java.sql.*;

import static org.junit.Assert.assertTrue;

public class EmpAllowanceTest {
    @BeforeClass
    public static void setupTest() {
        System.out.println("Will run before all test cases and only once in EmpAllowanceTest");
    }

    @AfterClass
    public static void doAfterAll() {
        // close the DB connection
        System.out.println("Will run after all test cases and only once in EmpAllowanceTest");
    }

    @Test
    public void  test3_checkAllowances() {
        try {
            Statement s = DBConnector.getDbConnection().createStatement();
            ResultSet resultSet = s.executeQuery("select employee_id, allowances from emp_sal_details_v1");
            while (resultSet.next()) {
                int empId = resultSet.getInt("employee_id");
                float allowances = resultSet.getFloat("allowances");
                System.out.printf("emp id: %d, allowances: %f\n", empId, allowances);
                Assert.assertEquals(allowances, 0.0, 0.0);
                //assertTrue("Commission percentage is valid", allowances == 0.0);
            }
        } catch (SQLException sqlExcept) {
            System.out.println(sqlExcept.getMessage());
        }
    }
}
