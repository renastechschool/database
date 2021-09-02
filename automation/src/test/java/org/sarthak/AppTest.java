package org.sarthak;

import org.junit.*;
import org.junit.runner.*;
import org.junit.runner.notification.Failure;

/**
 * Unit test for simple App.
 */
public class AppTest {
    public static void main(String[] args) {
        Result testResult = JUnitCore.runClasses(EmpTestSuite1.class);
        for (Failure f: testResult.getFailures()) {
            System.out.println(f.toString());
        }
    }
}
