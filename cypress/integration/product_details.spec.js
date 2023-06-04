/// <reference types="cypress" />

describe("example to-do app", () => {
  it("visits the home page", () => {
    cy.visit("/");
  });

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Navigate to product page", () => {
    cy.get(".products article").first().click();
    cy.get(".product-detail").should("be.visible");
  });
});
