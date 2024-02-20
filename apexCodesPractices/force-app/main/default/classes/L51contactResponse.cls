public class L51contactResponse {

	public Contact contact;

	public class MailingAddress {
		public String street;
		public String city;
		public String state;
		public String postalCode;
		public String country;
	}

	public class Contact {
		public String fName;
		public String lName;
		public String contactEmail;
		public String contactPhone;
		public String contactMobile;
		public MailingAddress mailingAddress;
		public MailingAddress otherAddress;
	  //public String contactCompany;
		public String contactTitle;
		public String contactLevel;
	}

	
	public static L51contactResponse parse(String json) {
		return (L51contactResponse) System.JSON.deserialize(json, L51contactResponse.class);
	}
}