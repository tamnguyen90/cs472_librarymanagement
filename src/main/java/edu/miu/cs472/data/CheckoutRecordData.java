package edu.miu.cs472.data;

import edu.miu.cs472.model.CheckoutRecordEntry;

import java.util.*;

public class CheckoutRecordData {
    private static Map<Integer, List<CheckoutRecordEntry>> checkoutRecordMap = new LinkedHashMap<>();

    public static Map<Integer, List<CheckoutRecordEntry>> getCurrentCheckoutRecords() {
        return checkoutRecordMap;
    }

    public static Collection<List<CheckoutRecordEntry>> getCurrentCheckoutRecordsList() {
        return checkoutRecordMap.values();
    }

    public static boolean addNewCheckoutRecord(CheckoutRecordEntry newRecord) {
        List<CheckoutRecordEntry> currentMemberRecords = checkoutRecordMap.get(newRecord.getOwner().getMemberId());
        if (currentMemberRecords == null) {
            currentMemberRecords = new ArrayList<>();
        }
        currentMemberRecords.add(newRecord);
        checkoutRecordMap.put(newRecord.getOwner().getMemberId(), currentMemberRecords);
        return true;
    }
}
