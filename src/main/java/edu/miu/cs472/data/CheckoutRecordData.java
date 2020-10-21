package edu.miu.cs472.data;

import edu.miu.cs472.model.CheckoutRecord;

import java.util.*;

public class CheckoutRecordData {
    private static Map<Integer, List<CheckoutRecord>> checkoutRecordMap = new LinkedHashMap<>();

    public static Collection<List<CheckoutRecord>> getCurrentCheckoutRecords() {
        return checkoutRecordMap.values();
    }

    public static boolean addNewCheckoutRecord(CheckoutRecord newRecord) {
        List<CheckoutRecord> currentMemberRecords = checkoutRecordMap.get(newRecord.getOwner().getMemberId());
        if (currentMemberRecords == null) {
            currentMemberRecords = new ArrayList<>();
        }
        currentMemberRecords.add(newRecord);
        checkoutRecordMap.put(newRecord.getOwner().getMemberId(), currentMemberRecords);
        return true;
    }
}
