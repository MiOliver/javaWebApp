package com.ning.domain;

/**
 * Created by ning on 10/15/15.
 */
public class ElecInvoiceRecord {
    private Integer Id;
    private String InvoiceCode;
    private String month;
    private String codeName;
    private String IsUsed;
    private String addTime;
    private String updateTime;

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public String getInvoiceCode() {
        return InvoiceCode;
    }

    public void setInvoiceCode(String invoiceCode) {
        InvoiceCode = invoiceCode;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }

    public String getIsUsed() {
        return IsUsed;
    }

    public void setIsUsed(String isUsed) {
        IsUsed = isUsed;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
}
