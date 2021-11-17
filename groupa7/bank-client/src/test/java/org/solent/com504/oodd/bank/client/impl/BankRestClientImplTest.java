/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package org.solent.com504.oodd.bank.client.impl;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.solent.com504.oodd.bank.client.model.dto.CreditCard;
import org.solent.com504.oodd.bank.client.model.dto.TransactionReplyMessage;

/**
 *
 * @author acer
 */
public class BankRestClientImplTest {

    String url = "http://com528bank.ukwest.cloudapp.azure.com:8080/rest";

    CreditCard fromCard = null;
    CreditCard toCard = null;
    String toUsername = null;
    String toPassword = null;

    public BankRestClientImplTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        fromCard = new CreditCard();

        fromCard.setCardnumber("5133880000000012");
        fromCard.setName("test user1");
        fromCard.setEndDate("11/21");
        fromCard.setCvv("123");

        toCard = new CreditCard();

        toCard.setCardnumber("4285860000000021");
        toCard.setName("test user2");
        toCard.setEndDate("11/21");
        toCard.setCvv("123");

        toUsername = "testuser2";
        toPassword = "defaulttestpass";

    }

    @After
    public void tearDown() {
    }

    /**
     * Test of transferMoney method, of class BankRestClientImpl.
     */
    @Test
    public void testTransaction() {
        System.out.println("Check Transaction");

        BankRestClientImpl rester = new BankRestClientImpl(url);

        String amount = "100";

        TransactionReplyMessage query = rester.transferMoney(fromCard, toCard, Double.valueOf(amount));
    }

    @Test
    public void testTransactionAnth() {
        System.out.println("Check Transaction with details");
        
        BankRestClientImpl rester = new BankRestClientImpl(url);

        String amount = "100";

        TransactionReplyMessage query = rester.transferMoney(fromCard, toCard, Double.valueOf(amount), toUsername, toPassword);
    }

}
