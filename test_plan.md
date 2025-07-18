# FinalProject Quality Assurance


# OrangeHRM Test Plan (BDD Format)

---

## 1. Test Objectives

The objective of this test plan is to verify and validate the **core functionalities** of the OrangeHRM system by designing and executing Behavior-Driven Development (BDD) test cases written in **Gherkin format**. These tests focus on **positive and negative scenarios**, **usability**, **field validations**, and **role-based access**.

---

## 2. Scope of Testing

### **In Scope**
This test plan includes the following major modules:

| Module      | Description |
|-------------|-------------|
| Login       | Verify valid/invalid login scenarios, and logout |
| PIM         | Add new employees, validate mandatory fields, search employees |
| Admin       | Add new system users, validate search functionality |
| Leave       | Add leave entitlements, assign leaves |

Each module will contain **at least 2–3 scenarios** including both positive and negative cases.

### **Out of Scope**
- Mobile testing
- API testing
- Third-party integration (e.g., email notifications, report generation)

---

## 3. Testing Strategy

### 3.1 Test Approach

| Aspect              | Description |
|---------------------|-------------|
| **Methodology**     | Behavior-Driven Development (BDD) |
| **Test Design**     | Gherkin `.feature` files using Given–When–Then syntax |
| **Test Execution**  | Manual testing through UI and/or automated with Cucumber/Selenium |
| **Reporting**       | Pass/Fail via test runner, screenshots (if needed), logs |

### 3.2 Feature Directory Structure

```plaintext
features/
├── 01_login.feature
├── 02_PIM.feature
├── 03_Admin.feature
└── 04_Leave.feature
```

Each file contains relevant scenarios grouped by feature for better readability and reusability.

---

## 4. Test Environment

| Component      | Description |
|----------------|-------------|
| **URL**        | https://opensource-demo.orangehrmlive.com/ |
| **Browser(s)** | Chrome (latest), Firefox (latest) |
| **OS**         | Windows 11, macOS Catalina or higher |
| **Account(s)** | Admin - Username: `Admin` / Password: `admin123` |

### Assumptions:
- Application is stable and available during testing
- Admin account is accessible with full privileges
- Data can be reset if necessary for clean testing

---

## 5. Test Coverage

The following table summarizes scenario coverage per module:

| Feature | Scenario Title | Type |
|---------|----------------|------|
| **Login** | Valid Login | Positive |
|          | Invalid Login | Negative |
|          | Logout | Positive |
| **PIM**   | Add Employee | Positive |
|          | Missing Fields Validation | Negative |
|          | Search Employee | Positive |
| **Admin** | Add New User | Positive |
|          | Search with No Results | Negative |
| **Leave** | Grant Entitlement and Assign Leave | Positive |

---

## 6. Risks and Mitigations

| Risk | Mitigation |
|------|------------|
| Demo site downtime | Test offline or notify instructor |
| Data overwritten by others | Use unique dummy names, test during low-traffic hours |
| Feature mismatch | Revalidate selectors and flows manually |

---

## 7. Entry and Exit Criteria

### Entry Criteria
- Test environment is accessible
- Admin login is successful
- `.feature` files are created and mapped to features

### Exit Criteria
- All test scenarios executed
- All critical bugs reported
- Pass rate ≥ 90% on positive test cases

---

## 8. Deliverables

- Gherkin `.feature` files:
  - `01_login.feature`
  - `02_PIM.feature`
  - `03_Admin.feature`
  - `04_Leave.feature`
- This test plan (`test_plan.md`)

---

## 9. Roles and Responsibilities

| Role | Responsibility |
|------|----------------|
| Student / QA Tester | Designing and executing BDD test cases |
| Instructor | Review scenarios, assess structure and coverage |
| Automation Tool (Optional) | Run scenarios for regression |

---
# Additional Test

## Performance Testing with k6

To complement the functional tests, basic performance tests were executed using [k6](https://k6.io/) on two REST API endpoints of the Fake REST API service.

### Scripts Overview

| Script           | Endpoint                    | Method | Description              |
|------------------|-----------------------------|--------|--------------------------|
| `get_users.js`    | `/api/v1/Users`             | GET    | Simulates user fetching  |
| `post_authors.js` | `/api/v1/Authors`           | POST   | Simulates data creation  |

### Test Configuration

- **VUs**: 20  
- **Duration**: 1 minute  
- **Thresholds**:
  - `http_req_duration`: 95% < 500ms  
  - `http_req_failed`: < 1%

### Sample `get_users.js`

```js
http.get('https://fakerestapi.azurewebsites.net/api/v1/Users');
```

### Sample `post_authors.js`

```js
http.post('https://fakerestapi.azurewebsites.net/api/v1/Authors', JSON.stringify({...}));
```

### Success Criteria

- 200 OK responses  
- ≤ 500ms response time for 95% of requests  
- Error rate < 1%

These scripts help identify basic latency issues and ensure the API remains stable under light concurrent load.

