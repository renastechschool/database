package org.sarthak;

import org.junit.*;

import static org.junit.Assert.*;

import java.sql.*;

import org.commons.DBConnector;

public class EmpSalTest {
    @BeforeClass
    public static void setupTest() {
        System.out.println("Will run before all test cases and only once");
        DBConnector.InitialiseDatabase();
    }

    @AfterClass
    public static void doAfterAll() {
        // close the DB connection
        System.out.println("Will run after all test cases and only once");
        DBConnector.CloseConnection();
    }

    @Before
    public void runBeforeTest() {
        System.out.println("Will run before every test case");
    }

    @Test
    public void test1_checkPctCommission() {
        try {
            Statement s = DBConnector.getDbConnection().createStatement();
            ResultSet resultSet = s.executeQuery("select employee_id, base_salary, pct_commission from emp_sal_details_v1");
            while (resultSet.next()) {
                int empId = resultSet.getInt("employee_id");
                float salary = resultSet.getFloat("base_salary");
                float pctCommission = resultSet.getFloat("pct_commission");
                System.out.printf("emp id: %d, salary: %f, commission: %f\n", empId, salary, pctCommission);

                boolean isPctCommissionOk = false;
                if (salary >= 1000 && pctCommission <= 0.25) isPctCommissionOk = true;
                else if (salary >= 2000 && pctCommission <= 0.4) isPctCommissionOk = true;
                else if (salary >= 5000 && pctCommission <= 0.5) isPctCommissionOk = true;
                else if (salary >= 10000 && pctCommission <= 0.7) isPctCommissionOk = true;

                assertTrue("Commission percentage is valid", isPctCommissionOk);
            }
        } catch (SQLException sqlExcept) {
            System.out.println(sqlExcept.getMessage());
        }
    }

    @Test
    public void test2_checkInsurancePremium() {
        /// empty test for now
    }

    @Ignore
    public void test3_checkAllowances() {
        // will not run till it is ignored
        System.out.println("I will never run since I have been ignored");
    }

    @After
    public void doAfter() {
        System.out.println("Will run after every test case");
    }
}
