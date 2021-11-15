package org.solent.com504.oodd.bank.client.model.client;

import org.solent.com504.oodd.bank.client.model.dto.CreditCard;
import org.solent.com504.oodd.bank.client.model.dto.TransactionReplyMessage;

public interface BankRestClient {

    public  TransactionReplyMessage transferMoney(CreditCard fromCard, CreditCard toCard, Double amount);

    public  TransactionReplyMessage transferMoney(CreditCard fromCard, CreditCard toCard, Double amount, String userName, String password);
}
