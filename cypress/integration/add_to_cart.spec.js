/// <reference types="cypress" />

describe("Jungle add to cart", () => {
  it("visits the home page", () => {
    cy.visit("/");
  });

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Click add to cart button", () => {
    cy.contains("My Cart (0)").should("exist")
    cy.get(".button_to button").first().click({ force: true });
    cy.contains("My Cart (0)").should("not.exist")
    cy.contains("My Cart (1)").should("exist")
  });
});
