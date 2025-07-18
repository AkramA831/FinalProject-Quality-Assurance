class DashboardPage {
  verifyDashboard() {
    cy.url().should('include', '/dashboard');
    cy.get('h6.oxd-topbar-header-breadcrumb-module').should('have.text', 'Dashboard');
  }

  navigateToAdmin() {
    cy.get('.oxd-main-menu-item-wrapper').contains('Admin').click();
    cy.get(':nth-child(1) > .oxd-main-menu-item').contains('Admin').should('be.visible').click();
  }
}

module.exports = new DashboardPage();