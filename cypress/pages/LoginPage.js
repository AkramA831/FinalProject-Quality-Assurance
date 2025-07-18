class LoginPage { 
  visit() {
    cy.visit('https://opensource-demo.orangehrmlive.com/');
  }

  enterUsername(username) { 
    cy.get('input[name="username"]').clear().type(username);
  }

  enterPassword(password) { 
    cy.get('input[name="password"]').clear().type(password); 
  }

  clickLogin() { 
    cy.get('button[type="submit"]').click(); 
  }
}

module.exports = new LoginPage(); 