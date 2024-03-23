//Dummy Data For 不同的posts
import 'dart:math';


class DummyData{

List<String> name = [
  "This is Username",
  "Cool_User123",
  "Flutter_Learner",
  "TechEnthusiast",
  "NatureLover",
  "Bookworm98",
  "Coffeeholic",
  "TravelJunkie",
  "MusicBuff",
  "CreativeSoul",
];

List<DateTime> publishedDate = List.generate(10, (index) {
  final randomDate = DateTime.now().subtract(Duration(days: (10 - index) * index));
  return randomDate;
});

List<String> content = [
  "Just started using a budgeting app and feeling more in control of my finances! #budgetingtips",
  "Finally paid off that credit card debt!  Now to focus on saving for a down payment on a house. #debtfreejourney",
  "Investing can seem scary, but starting small is key. Researching different options and investing a little each month can make a big difference in the long run. #investingforbeginners",
  "Is that new credit card offer really worth it? Look at the interest rates and annual fees before you swipe! #creditcardtips",
  "Meal prepping is a great way to save money on groceries and eat healthier. #frugalliving",
  "Travel doesn't have to break the bank! Look for deals on flights and accommodations, and consider alternative travel methods like trains or buses. #travelhacks",
  "Thinking about retiring early? Planning and saving early are crucial. #earlyretirement",
  "Financial freedom isn't about having millions, but about being able to live comfortably without being controlled by money. #financialfreedom",
  "Just downloaded a new expense tracker app. Excited to see where my money's going! #expensemanagement",
  "Reading a book on personal finance. Learning so much about managing my money effectively. #financialeducation",
];

List<int> numLikes = List.generate(10, (index) => Random().nextInt(1000)); // Range: 0 - 999

List<int> numComments = List.generate(10, (index) => Random().nextInt(100)); // Range: 0 - 99

List<int> numShare = List.generate(10, (index) => Random().nextInt(100)); // Convert to string

List<String> profilePicUrl = [
  "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZKDjc4GfTFdXNit7vccTvNks5xi-hWv6BzdE2Zy4dWo2GknkjgShG5AHGaRT-fVjU53o&usqp=CAU",
  "https://wallpapers.com/images/featured/cool-profile-picture-87h46gcobjl5e4xu.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQulMZB0sNe1L-JPcXigWD1LJJx5Z2Wcp2nghIbNezt3VbWZNSXySBmpkndzawzGtZdVA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1aelHWPkXE0JGd0u8nrsmxYbBtcdOrBW2t5fOEUG8zpZNFnLbKl5IHvcuvcz7f_ilR1w&usqp=CAU",
  "https://i.pinimg.com/474x/25/5b/3a/255b3a6ed74b44ca24ece91eed73cd13.jpg",
  "https://wallpapers.com/images/hd/instagram-profile-pictures-7z4qm2xro1kk3xik.jpg",
  "https://api.blog.production.linktr.ee/wp-content/uploads/2023/02/Young-woman-taking-a-selfie-with-an-iPhone.jpeg",
  "https://i.pinimg.com/474x/32/55/7e/32557e39544c71ad493eded3df77e593.jpg",
  "https://lh6.googleusercontent.com/proxy/PKNp5ulcmfpnjmiqLfv36FpKgodMj6Gns-5aFOcBoJUNzwgEF0WNzIxh9ljRTjXZdazdESA4KBFG1TWtEKDhoouKK-1YdQ_tWbRKagIjCPRml2xyERzQZJw4_fwfttgcADchaVd3emOZfpQUkczG",
];

}




class DummyComments{

  List<String> name = [
    "CodingCat",
    "PizzaFanatic",
    "DIYExpert",
    "WordsmithWiz",
    "GymRat",
    "GamerGirl",
    "MemeMaster",
    "FoodieExplorer",
    "NightOwl",
    "PlantParent",
  ];


  List<String> debtManagementComments = [
    "Creating a budget and sticking to it is essential for managing debt. Track your income and expenses to see where your money goes. #debtmanagementtips",
    "The snowball or avalanche method can help you tackle your debt faster. Choose the approach that best suits your situation. #debtrepaymentstrategies",
    "Negotiate lower interest rates with your creditors whenever possible. It can save you a significant amount of money in the long run. #debtnegotiation",
    "Consider a debt consolidation loan to simplify your payments and potentially lower your interest rate.  Weigh the pros and cons carefully. #debtconsolidation",
    "Avoid taking on new debt while you're trying to pay off existing debt. Focus on prioritizing your current obligations. #stayingoutofdebt",
    "There's no shame in seeking help! A credit counselor can provide guidance and support on your debt management journey. #creditcounseling",
    "Celebrate your milestones! Paying off even a small debt is a step in the right direction. Stay motivated and keep going! #debtfreecelebration",
    "Remember, debt management is a marathon, not a sprint. Be patient, stay focused, and you'll achieve your goals. #debtfreejourney",
    "Automate your debt payments to ensure you never miss a payment and incur late fees. #debtmanagementtools",
    "Building an emergency fund can help you avoid going into debt in case of unexpected expenses. #financialpreparedness",
  ];

  List<int> numLikes = List.generate(10, (index) => Random().nextInt(1000)); // Range: 0 - 999

  List<DateTime> publishedDate = List.generate(10, (index) {
    final randomDate = DateTime.now().subtract(Duration(days: (10 - index) * index));
    return randomDate;
  });

  List<String> profilePicUrl = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWxlUYZ-5xerJ_Rz9ECyXW1yBn2L-NlUr26A&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuqO0ny7ZxJj28_Nc2_8JixwJcFUEGW4G0aI--brQASw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStePsr_S-LyXrNbwLxmAirlxBVPJxJ47Pd1g&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvqvVIrtgR1B-A1jQHTW-Yv_rfGqXE74zRHUIMc6KQsg&s",
    "https://sb.kaleidousercontent.com/67418/1920x1281/0e9f02a048/christian-buehner-ditylc26zvi-unsplash.jpg",
    "https://sb.kaleidousercontent.com/67418/1920x1545/c5f15ac173/samuel-raita-ridxdghg7pw-unsplash.jpg",
    "https://sb.kaleidousercontent.com/67418/1672x1018/6463a5af0d/screenshot-2022-05-24-at-15-22-28.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgZHNc5teEcC0sUjjLOVaUq43Gbd2Rn2GoLx1bTbGmO7Bm3r8z4C5eD0rYNy5phyxNuFM&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaxcazjLKPaP2_xIYVKQV2sisCxMw9gCqo8w9NwWc6Y1xfFZfOxXmcCqiDjH2BvvHTNI&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTX1zR4dKbppmIMgBYHKKOvMi9yetNOuF8sVzS5Zt39b-Nqj6bxOo98wpLPOm8Z-hhsbeg&usqp=CAU",

  ];
}

enum Classifications {forYou,followong,debtManageStractegies,financialPlanning,financialProductsAndServices}

class DummyArticle {


  List<String> authorName = [  ];
  List<String> authorProfilePic = [  ];
  List<String> publishedDate = [  ];
  List<String> title = [  ];
  List<String> content = [  ];
  List<String> hashtag = [  ];
  List<String> pic = [  ];



  getData(classification){

    switch(classification){

      case Classifications.forYou:
        {
         authorName = [
        "Mortgage Specialist",
        "Real Estate Agent",
        "Home Loan Expert",
        "Financial Planner",
        "Housing Market Analyst",
        "Property Inspector",
        "Homeownership Coach",
        "Interior Design Consultant",
        "Real Estate Attorney",
        "Property Maintenance Guide"
        ];

        authorProfilePic = [
          "https://media.sketchfab.com/models/9c2ca347b6de42419290cddc069302df/thumbnails/178cc45db4e1492da20852c9bad10b95/720x405.jpeg",
          "https://assets-global.website-files.com/60dc6ae8180195f8ea01743a/642acf81a37d835e9ac48a33_zDncwBGRT8Dj_sHBdvzjMj4LXi0Cfpg7s_fId8ADMi1i-WQ3SCGVoG7oCUkNwjR2L7BoJZUK5W00UQjImYThUrYmV27QsvuM_Cr3r_HJxTTdTv-SgwlyCx460ER5DwofkHZ8ilutP2xmil6E0cNcnlM.png",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLuG8fJGMdRIy3J4q5e9wH7xg9EEouowv8zUJfxtYMfCAEjNVzztA7EazIeQsF3PELILc&usqp=CAU",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-bJcbthetuL8KsZedF79FAWnfQ7sJYOVXMw0Qm-ADk5sogadWwj1BL35e4JzgMP4lC5Q&usqp=CAU",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM-Nx01wnV7q6vhbRE9cdHwTCDdWCcJvxU9EsG00f39tDrRJe-UVM_Dt0aw2RIkkuVU2A&usqp=CAU",
          "https://media.sketchfab.com/models/9c2ca347b6de42419290cddc069302df/thumbnails/178cc45db4e1492da20852c9bad10b95/720x405.jpeg",
          "https://assets-global.website-files.com/60dc6ae8180195f8ea01743a/642acf81a37d835e9ac48a33_zDncwBGRT8Dj_sHBdvzjMj4LXi0Cfpg7s_fId8ADMi1i-WQ3SCGVoG7oCUkNwjR2L7BoJZUK5W00UQjImYThUrYmV27QsvuM_Cr3r_HJxTTdTv-SgwlyCx460ER5DwofkHZ8ilutP2xmil6E0cNcnlM.png",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLuG8fJGMdRIy3J4q5e9wH7xg9EEouowv8zUJfxtYMfCAEjNVzztA7EazIeQsF3PELILc&usqp=CAU",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-bJcbthetuL8KsZedF79FAWnfQ7sJYOVXMw0Qm-ADk5sogadWwj1BL35e4JzgMP4lC5Q&usqp=CAU",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM-Nx01wnV7q6vhbRE9cdHwTCDdWCcJvxU9EsG00f39tDrRJe-UVM_Dt0aw2RIkkuVU2A&usqp=CAU",
        ];

         publishedDate = [
        "Jan 23, 2024",
        "Feb 14, 2024",
        "Mar 08, 2024",
        "Apr 05, 2024",
        "May 02, 2024",
        "Jun 30, 2024",
        "Jul 27, 2024",
        "Aug 24, 2024",
        "Sep 21, 2024",
        "Oct 18, 2024"
        ];

         title = [
        "Navigating the Mortgage Maze: A Guide for First-Time Homebuyers",
        "Understanding Different Mortgage Options: Finding the Right Fit",
        "Qualifying for a Mortgage: Building a Strong Financial Profile",
        "The Homebuying Process: Step-by-Step Guide from Pre-Approval to Closing",
        "Negotiating the Best Deal: Strategies for Getting Your Dream Home",
        "Property Inspection 101: What to Expect and How to Prepare",
        "Transitioning to Homeownership: Managing Your New Budget and Responsibilities",
        "Creating Your Dream Home: Interior Design Tips for Functionality and Style",
        "Legal Considerations in Homeownership: Understanding Contracts and Property Rights",
        "Essential Home Maintenance Tips: Keeping Your Investment Protected"
        ];

         content = [
        "Demystify the mortgage process for first-time homebuyers, explaining different loan types and navigating the application journey.",
        "Explore various mortgage options like fixed-rate, adjustable-rate, and FHA loans, helping users choose the most suitable one.",
        "Guide users through building a strong credit score, saving for a down payment, and improving debt-to-income ratio to qualify for a mortgage.",
        "Provide a step-by-step breakdown of the homebuying process, from pre-approval to inspections, negotiations, and finally, closing the deal.",
        "Offer effective strategies for negotiating with sellers, ensuring you get the best possible price and terms for your dream home.",
        "Explain the importance of a property inspection, highlighting what to expect during the process and how to prepare for it.",
        "Discuss the financial realities of homeownership, budgeting for mortgage payments, property taxes, and unexpected expenses.",
        "Provide tips for creating a functional and stylish living space, considering personal preferences and maximizing the home's potential.",
        "Explain legal aspects of buying and owning a home, including contracts, property titles, and potential legal issues to be aware of.",
        "Offer essential home maintenance tips for common areas like plumbing, electrical systems, and preventive measures to  protect your investment."
        ];

        hashtag = [
        "Mortgages",
        "Homeownership",
        "FirstTimeHomebuyer",
        "MortgageOptions",
        "HomebuyingProcess",
        "PropertyInspection",
        "HomeBudgeting",
        "Mortgages",
        "Homeownership",
        "FirstTimeHomebuyer",
        ];

        pic = [
          'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
          'https://images.unsplash.com/photo-1566438480900-0609be27a4be?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
          'https://images.unsplash.com/photo-1517329782449-810562a4ec2f?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
          'https://images.unsplash.com/photo-1613323593608-abc90fec84ff?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
          'https://images.unsplash.com/photo-1551021794-03be4ddaf67d?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGltYWdlfGVufDB8fDB8fHww',
          "https://www.incharge.org/wp-content/uploads/2015/06/Debt-Management-Plan-Requirements.png",
          "https://media.licdn.com/dms/image/C5112AQFVeXZzVVStHg/article-cover_image-shrink_600_2000/0/1557292444643?e=2147483647&v=beta&t=8IAZFSwIoduClIdiBFMqScIdJkQGD6Z1gsWfNAeuFu8",
          "https://i0.wp.com/kanoassembly.gov.ng/wp-content/uploads/2021/12/dmp_feature_blog.jpg?fit=400%2C284&ssl=1",
          "https://www.incharge.org/wp-content/uploads/2015/06/Debt-Management-Plan-Requirements.png",
          'https://images.unsplash.com/photo-1566438480900-0609be27a4be?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aW1hZ2V8ZW58MHx8MHx8fDA%3D',

        ];

        break;
        }

      case Classifications.followong:
        break;


      case Classifications.debtManageStractegies:{


        authorName = [
          "Nikhil Adithyan",
          "John Doe",
          "Jane Smith",
          "Alice Walker",
          "Bob Johnson",
          "Emily Garcia",
          "David Miller",
          "Sarah Jones",
          "Michael Brown",
          "Olivia Williams"
        ];

        authorProfilePic = [
          'https://plus.unsplash.com/premium_photo-1676637000058-96549206fe71?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
          'https://images.unsplash.com/photo-1488372759477-a7f4aa078cb6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
          'https://plus.unsplash.com/premium_photo-1680553492268-516537c44d91?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
          'https://images.unsplash.com/photo-1574169208507-84376144848b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
          'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
          'https://images.unsplash.com/photo-1595147389795-37094173bfd8?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGltYWdlfGVufDB8fDB8fHww',
          'https://images.unsplash.com/photo-1574169207511-e21a21c8075a?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGltYWdlfGVufDB8fDB8fHww',
          'https://images.unsplash.com/photo-1633621412960-6df85eff8c85?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGltYWdlfGVufDB8fDB8fHww',
          'https://plus.unsplash.com/premium_photo-1682513184135-b7b9b76fb4eb?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGltYWdlfGVufDB8fDB8fHww',
          'https://images.unsplash.com/photo-1593466144596-8abd50ad2c52?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGltYWdlfGVufDB8fDB8fHww',

        ];

        publishedDate = [
          "Jan 23, 2024",
          "Feb 14, 2024",
          "Mar 08, 2024",
          "Apr 05, 2024",
          "May 02, 2024",
          "Jun 30, 2024",
          "Jul 27, 2024",
          "Aug 24, 2024",
          "Sep 21, 2024",
          "Oct 18, 2024"
        ];

        title = [
          "Debt Management Basics",
          "Understanding Different Types of Debt",
          "Creating a Budget to Tackle Debt",
          "Negotiating with Creditors for Lower Rates",
          "Debt Consolidation Strategies",
          "The Benefits of Debt Payoff Plans",
          "Building an Emergency Fund to Avoid Debt",
          "Lifestyle Changes to Help Manage Debt",
          "Seeking Help From Credit Counseling Services",
          "Financial Wellness After Debt Repayment"
        ];

        content = [
          "Introduce the concept of debt management and its importance in financial health.",
          "Explain the differences between common debt types like credit cards, student loans, and mortgages.",
          "Provide guidance on creating a budget that prioritizes debt repayment while covering essential expenses.",
          "Offer strategies for negotiating lower interest rates with creditors to save money on debt payments.",
          "Discuss the pros and cons of debt consolidation and how it can simplify debt management.",
          "Highlight the benefits of structured debt payoff plans in achieving financial freedom.",
          "Emphasize the importance of an emergency fund to avoid relying on debt for unexpected events.",
          "Suggest lifestyle adjustments that minimize unnecessary spending and support debt repayment goals.",
          "Explain the role of credit counseling services in providing guidance and support for debt management.",
          "Discuss the importance of financial wellness and maintaining healthy financial habits after debt repayment."
        ];

        hashtag = [
          "DebtManagement",
          "DebtTypes",
          "Budgeting",
          "DebtNegotiation",
          "Consolidation",
          "DebtPayoff",
          "EmergencyFund",
          "DebtFreeLifestyle",
          "CreditCounseling",
          "FinancialWellness"
        ];

        pic = [
          'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
          'https://images.unsplash.com/photo-1566438480900-0609be27a4be?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
          'https://images.unsplash.com/photo-1517329782449-810562a4ec2f?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
          'https://images.unsplash.com/photo-1613323593608-abc90fec84ff?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
          'https://images.unsplash.com/photo-1551021794-03be4ddaf67d?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGltYWdlfGVufDB8fDB8fHww',
          'https://plus.unsplash.com/premium_photo-1687382111414-7b87afa5da34?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGltYWdlfGVufDB8fDB8fHww',
          'https://images.unsplash.com/photo-1598214886806-c87b84b7078b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGltYWdlfGVufDB8fDB8fHww',
          'https://images.unsplash.com/photo-1628784230353-5bee16e2f005?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGltYWdlfGVufDB8fDB8fHww',
          'https://images.unsplash.com/photo-1621155346337-1d19476ba7d6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGltYWdlfGVufDB8fDB8fHww',
          'https://images.unsplash.com/photo-1603201101485-e232d22ad18b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGltYWdlfGVufDB8fDB8fHww',
          'https://plus.unsplash.com/premium_photo-1676637000058-96549206fe71?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',

        ];

        break;
      }


      case Classifications.financialPlanning:
        {

          authorName = [
            "Financial Guru",
            "Investment Analyst",
            "Budgeting Expert",
            "Retirement Planner",
            "Wealth Management Specialist",
            "Financial Educator",
            "Risk Management Consultant",
            "Tax Strategist",
            "Estate Planning Attorney",
            "Long-Term Planning Advisor"
          ];

          title = [
            "Financial Planning Basics",
            "Setting SMART Financial Goals",
            "Understanding Your Risk Tolerance",
            "Budgeting for a Secure Financial Future",
            "Investing 101: Exploring Investment Options",
            "Building a Diversified Investment Portfolio",
            "Saving for Retirement: The Power of Compound Interest",
            "Protecting Your Assets with Insurance",
            "Estate Planning: Securing Your Legacy",
            "Developing a Long-Term Financial Strategy"
          ];

          content = [
            "Introduce the concept of financial planning and its importance in achieving your financial goals.",
            "Explain the SMART goal framework (Specific, Measurable, Achievable, Relevant, Time-bound) for setting effective financial goals.",
            "Guide users through assessing their risk tolerance to make informed investment decisions.",
            "Offer budgeting strategies to manage income and expenses effectively, building a strong financial foundation.",
            "Provide an overview of various investment options like stocks, bonds, mutual funds, and real estate.",
            "Discuss the importance of diversification in mitigating risk and creating a balanced investment portfolio.",
            "Emphasize the power of compound interest for long-term wealth creation, particularly regarding retirement savings.",
            "Explain different types of insurance (life, health, property) and their importance in protecting your assets against unforeseen events.",
            "Introduce the concept of estate planning, including wills and trusts, to ensure your assets are distributed according to your wishes.",
            "Discuss the significance of developing a long-term financial strategy to achieve your financial goals throughout life."
          ];

          hashtag = [
            "FinancialPlanning",
            "SMARTGoals",
            "RiskTolerance",
            "Budgeting",
            "Investing",
            "Diversification",
            "CompoundInterest",
            "Insurance",
            "EstatePlanning",
            "LongTermStrategy"
          ];

          authorProfilePic = [
            'https://images.unsplash.com/photo-1517329782449-810562a4ec2f?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
            'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
            'https://images.unsplash.com/photo-1566438480900-0609be27a4be?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
            'https://images.unsplash.com/photo-1488372759477-a7f4aa078cb6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
            'https://plus.unsplash.com/premium_photo-1680553492268-516537c44d91?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
            'https://images.unsplash.com/photo-1574169208507-84376144848b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
            'https://images.unsplash.com/photo-1517329782449-810562a4ec2f?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
            'https://images.unsplash.com/photo-1613323593608-abc90fec84ff?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
            'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
            'https://images.unsplash.com/photo-1551021794-03be4ddaf67d?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGltYWdlfGVufDB8fDB8fHww',
          ];

          publishedDate = [
            "Jan 23, 2023",
            "Feb 14, 2023",
            "Mar 08, 2024",
            "Apr 05, 2024",
            "May 02, 2024",
            "Jun 30, 2024",
            "Jul 27, 2024",
            "Aug 24, 2024",
            "Sep 21, 2024",
            "Oct 18, 2024"
          ];


          pic = [
            'https://images.unsplash.com/photo-1595147389795-37094173bfd8?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGltYWdlfGVufDB8fDB8fHww',
            'https://images.unsplash.com/photo-1574169207511-e21a21c8075a?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGltYWdlfGVufDB8fDB8fHww',
            'https://plus.unsplash.com/premium_photo-1687382111414-7b87afa5da34?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGltYWdlfGVufDB8fDB8fHww',
            'https://images.unsplash.com/photo-1633621412960-6df85eff8c85?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGltYWdlfGVufDB8fDB8fHww',
            'https://images.unsplash.com/photo-1598214886806-c87b84b7078b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGltYWdlfGVufDB8fDB8fHww',
            'https://images.unsplash.com/photo-1628784230353-5bee16e2f005?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGltYWdlfGVufDB8fDB8fHww',
            'https://plus.unsplash.com/premium_photo-1682513184135-b7b9b76fb4eb?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGltYWdlfGVufDB8fDB8fHww',
            'https://images.unsplash.com/photo-1621155346337-1d19476ba7d6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGltYWdlfGVufDB8fDB8fHww',
            'https://images.unsplash.com/photo-1593466144596-8abd50ad2c52?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGltYWdlfGVufDB8fDB8fHww',
            'https://images.unsplash.com/photo-1603201101485-e232d22ad18b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGltYWdlfGVufDB8fDB8fHww',

          ];

          break;
        }

      case Classifications.financialProductsAndServices:
          {
            authorName = [
              "Financial Advisor",
              "Investment Banker",
              "Wealth Manager",
              "Loan Specialist",
              "Insurance Broker",
              "Retirement Planner",
              "Tax Consultant",
              "Financial Educator",
              "FinTech Expert",
              "Consumer Advocate"
            ];

            authorProfilePic = [
              'https://images.unsplash.com/photo-1595147389795-37094173bfd8?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGltYWdlfGVufDB8fDB8fHww',
              'https://images.unsplash.com/photo-1574169207511-e21a21c8075a?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGltYWdlfGVufDB8fDB8fHww',
              'https://plus.unsplash.com/premium_photo-1687382111414-7b87afa5da34?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGltYWdlfGVufDB8fDB8fHww',
              'https://images.unsplash.com/photo-1633621412960-6df85eff8c85?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGltYWdlfGVufDB8fDB8fHww',
              'https://images.unsplash.com/photo-1598214886806-c87b84b7078b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGltYWdlfGVufDB8fDB8fHww',
              'https://images.unsplash.com/photo-1628784230353-5bee16e2f005?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGltYWdlfGVufDB8fDB8fHww',
              'https://plus.unsplash.com/premium_photo-1682513184135-b7b9b76fb4eb?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGltYWdlfGVufDB8fDB8fHww',
              'https://images.unsplash.com/photo-1621155346337-1d19476ba7d6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGltYWdlfGVufDB8fDB8fHww',
              'https://images.unsplash.com/photo-1593466144596-8abd50ad2c52?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGltYWdlfGVufDB8fDB8fHww',
              'https://images.unsplash.com/photo-1603201101485-e232d22ad18b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGltYWdlfGVufDB8fDB8fHww',

            ];

            publishedDate = [
              "Jan 23, 2024",
              "Feb 14, 2024",
              "Mar 08, 2024",
              "Apr 05, 2024",
              "May 02, 2024",
              "Jun 30, 2024",
              "Jul 27, 2024",
              "Aug 24, 2024",
              "Sep 21, 2024",
              "Oct 18, 2024"
            ];

            title = [
              "Understanding Your Financial Needs: Choosing the Right Products and Services",
              "Savings Accounts: Building Your Financial Foundation",
              "Demystifying Checking Accounts: Managing Everyday Expenses",
              "Credit Cards: Responsible Use for Building Credit and Rewards",
              "Loan Options: Financing Your Needs from Education to Homeownership",
              "Investing 101: Exploring Investment Vehicles for Long-Term Goals",
              "Insurance Essentials: Protecting Yourself and Your Assets",
              "Retirement Planning: Building a Secure Financial Future",
              "The Rise of FinTech: How Technology is Transforming Financial Services",
              "Making Informed Decisions: Tips for Choosing Financial Products and Services"
            ];

            content = [
              "Guide users through identifying their financial goals and risk tolerance to choose suitable financial products and services.",
              "Explain the benefits of savings accounts, different types available, and how they contribute to financial stability.",
              "Discuss the functionalities of checking accounts, managing debit cards, and responsible check usage for daily transactions.",
              "Provide insights into credit card usage, building credit history, maximizing rewards programs, and avoiding debt pitfalls.",
              "Explore various loan options like personal loans, mortgages, student loans, and auto loans, considering eligibility and repayment terms.",
              "Introduce different investment vehicles like stocks, bonds, mutual funds, and ETFs, highlighting their risk-reward profiles.",
              "Explain various types of insurance (life, health, property, etc.) and their importance in protecting against financial risks.",
              "Emphasize the importance of retirement planning through employer-sponsored plans, IRAs, and other investment strategies.",
              "Discuss the growing FinTech industry, exploring its innovative solutions like mobile banking, robo-advisors, and digital payments.",
              "Offer tips for conducting research, comparing features, and understanding fees before choosing financial products and services."
            ];

            hashtag = [
              "FinancialProducts",
              "FinancialServices",
              "SavingsAccounts",
              "CheckingAccounts",
              "CreditCards",
              "Loans",
              "Investing",
              "Insurance",
              "RetirementPlanning",
              "FinTech"
            ];

            pic = [
              'https://plus.unsplash.com/premium_photo-1676637000058-96549206fe71?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
              'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
              'https://images.unsplash.com/photo-1566438480900-0609be27a4be?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
              'https://images.unsplash.com/photo-1488372759477-a7f4aa078cb6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
              'https://plus.unsplash.com/premium_photo-1680553492268-516537c44d91?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
              'https://images.unsplash.com/photo-1574169208507-84376144848b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
              'https://images.unsplash.com/photo-1517329782449-810562a4ec2f?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
              'https://images.unsplash.com/photo-1613323593608-abc90fec84ff?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
              'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
              'https://images.unsplash.com/photo-1551021794-03be4ddaf67d?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGltYWdlfGVufDB8fDB8fHww',

            ];
          }

      default:
        break;
    }


  }


}




class ImageDB{
  List imgs = [
    'https://plus.unsplash.com/premium_photo-1687382111414-7b87afa5da34?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGltYWdlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1598214886806-c87b84b7078b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGltYWdlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1628784230353-5bee16e2f005?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGltYWdlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1621155346337-1d19476ba7d6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGltYWdlfGVufDB8fDB8fHww',


    'https://images.unsplash.com/photo-1603201101485-e232d22ad18b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGltYWdlfGVufDB8fDB8fHww',
    'https://plus.unsplash.com/premium_photo-1676637000058-96549206fe71?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
    'https://plus.unsplash.com/premium_photo-1680553492268-516537c44d91?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1517329782449-810562a4ec2f?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
    'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1574169207511-e21a21c8075a?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGltYWdlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1628784230353-5bee16e2f005?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGltYWdlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1621155346337-1d19476ba7d6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGltYWdlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1488372759477-a7f4aa078cb6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1574169208507-84376144848b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1595147389795-37094173bfd8?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGltYWdlfGVufDB8fDB8fHww',
    'https://plus.unsplash.com/premium_photo-1687382111414-7b87afa5da34?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGltYWdlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1598214886806-c87b84b7078b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGltYWdlfGVufDB8fDB8fHww',
    'https://plus.unsplash.com/premium_photo-1682513184135-b7b9b76fb4eb?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGltYWdlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1593466144596-8abd50ad2c52?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGltYWdlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1566438480900-0609be27a4be?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1613323593608-abc90fec84ff?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1551021794-03be4ddaf67d?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGltYWdlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1633621412960-6df85eff8c85?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGltYWdlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1603201101485-e232d22ad18b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGltYWdlfGVufDB8fDB8fHww'
  ];
}