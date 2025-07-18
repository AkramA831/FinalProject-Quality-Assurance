class AdminPage {

  clickAddUser() {
    cy.get('.orangehrm-header-container > .oxd-button').contains('Add').should('be.visible').click();
    cy.get('.oxd-text--h6').contains('Add User').should('be.visible');
  }

  selectUserRole(role) {
    cy.get('.oxd-select-wrapper').eq(0).click();
    cy.get('.oxd-select-option').contains(role).click();
  }

  enterEmployeeName(employeeName) {
    cy.get('input[placeholder="Type for hints..."]').type(employeeName);
    cy.get('.oxd-autocomplete-option').contains(employeeName).should('be.visible').first().click();

  }
  selectStatus(status) {
    cy.get('.oxd-select-wrapper').eq(1).click();
    cy.get('.oxd-select-option').contains(status).click();
  }

  enterUsername(newUsername) {
    cy.get('.oxd-form-row')
    .filter(':has(label:contains("Username"))')
    .within(() => {
      cy.get('input').eq(1).type(newUsername); // or use eq(0)
    });
  }

  enterPassword(password) {
cy.get('.oxd-form-row')
    .filter(':has(label:contains("Password"))')
    .first()
    .within(() => {
      cy.get('input[type="password"]').eq(0).type(password);
    });
  }

  confirmPassword(password) {

   cy.get('.oxd-form-row')
    .filter(':has(label:contains("Confirm Password"))')
    .first()
    .within(() => {
      cy.get('input[type="password"]').eq(1).type(password);
    });
  }

  clickSave() {
    cy.get('button[type="submit"]').click();
    cy.wait(5000);

  }

  verifyUserInList(username) {
    
  cy.get('.oxd-form-row')
    .filter(':has(label:contains("Username"))')
    .within(() => {
      cy.get('input').eq(0).clear().type(username);
    });

  cy.get('button').contains('Search').click();

  cy.wait(5000);

  cy.get('.oxd-table-body', { timeout: 10000 }).should('contain', username);
  }

  verifyExistingUsernameError() {
    cy.get('.oxd-input-group__message').should('contain.text', 'Already exists');
  }
}

module.exports = new AdminPage();