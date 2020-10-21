package edu.miu.cs472.data;

import edu.miu.cs472.model.Address;
import edu.miu.cs472.model.LibraryMember;

import java.util.ArrayList;
import java.util.List;

public class LibraryMemberData {
    private static int memberId = 1;
    private static List<LibraryMember> libraryMemberList = new ArrayList<LibraryMember>() {{
        Address add1 = new Address("1302 S Main st", "Fairfield", "Iowa", "52556");
        add(new LibraryMember("Huu Tam", "Nguyen", new Address("1302 S Main st", "Fairfield", "Iowa", "52556"), "6418191234"));
        add(new LibraryMember("Duy Hanh", "Nguyen", new Address("1000 N 4th st", "Fairfield", "Iowa", "52557"), "6418191235"));
        add(new LibraryMember("Duy Thai", "Nguyen", new Address("123 W 2th st", "Fairfield", "Iowa", "52557"), "6418191236"));
        add(new LibraryMember("Van Thai", "Nguyen", new Address("1302 S D st", "Fairfield", "Iowa", "52657"), "6418191237"));
        add(new LibraryMember("Dinh Nhan", "Vo", new Address("1000 N 4th st", "Fairfield", "Iowa", "52557"), "6418191238"));
        add(new LibraryMember("Truong Thanh Nam", "Nguyen", new Address("12 E Harrison Eve", "Fairfield", "Iowa", "52527"), "6418191239"));
        add(new LibraryMember("Vo Huy Bao", "Nguyen", new Address("345 N Main st", "Fairfield", "Iowa", "52577"), "6418191240"));
        add(new LibraryMember("Duc Phuoc", "Doan", new Address("123 N Main st", "Fairfield", "Iowa", "52577"), "6418191241"));
        add(new LibraryMember("Le Hieu", "Le", new Address("1120 Burlington Eve", "Fairfield", "Iowa", "52677"), "6418191242"));
        add(new LibraryMember("Thanh Nam", "Nguyen", new Address("122 5th st", "Fairfield", "Iowa", "52477"), "6418191243"));
    }};

    public static List<LibraryMember> getCurrentMembers() {
        return libraryMemberList;
    }

    public static boolean addNewMember(LibraryMember newMember) {
        if (newMember == null) {
            return false;
        }
        return libraryMemberList.add(newMember);
    }
}
