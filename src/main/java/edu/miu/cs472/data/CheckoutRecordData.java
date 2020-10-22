package edu.miu.cs472.data;

import edu.miu.cs472.model.CheckoutRecordEntry;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

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

    public static void updateMemberCheckoutRecords(int memberId, List<CheckoutRecordEntry> checkoutRecordEntries) {
        checkoutRecordMap.put(memberId, checkoutRecordEntries);
    }

    public static List<CheckoutRecordEntry> getExpiredCheckoutEntries() {
        Collection<List<CheckoutRecordEntry>> currentCheckoutEntries = checkoutRecordMap.values();
        List<CheckoutRecordEntry> result = new ArrayList<>();
        for(List<CheckoutRecordEntry> entry : currentCheckoutEntries) {
            List<CheckoutRecordEntry> expires = entry.stream()
                    .filter(e -> e.getDueDate().compareTo(LocalDate.now()) < 0)
                    .collect(Collectors.toList());
            if (expires != null && !expires.isEmpty()) {
                result.addAll(expires);
            }
        }
        return result;
    }
}
