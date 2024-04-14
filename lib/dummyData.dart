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
          """Debt Management Basics: Taking Control of Your Financial Obligations
Debt. It's a four-letter word that can evoke feelings of stress, anxiety, and even shame. But the reality is, debt is a common financial tool used by millions to achieve goals like buying a home, financing an education, or making necessary purchases. The key to financial well-being lies not in avoiding debt altogether, but in managing it effectively.

This article equips you with the fundamental knowledge of debt management, empowering you to take control of your financial obligations and achieve financial freedom.

What is Debt Management?
Debt management refers to the process of developing strategies to repay borrowed money in a timely manner and at the lowest possible cost. It encompasses several key aspects:

Understanding your debt: Knowing the total amount owed, interest rates, minimum payments, and loan terms for each debt.
Creating a budget: Tracking your income and expenses to identify areas where you can allocate more funds towards debt repayment.
Developing a repayment plan: Prioritizing which debts to tackle first and outlining a strategy for paying them off.
Exploring debt-relief options: Considering solutions like debt consolidation, credit counseling, or debt negotiation (in extreme cases) to potentially reduce interest rates or simplify repayment.
Effective debt management not only reduces your financial burden but also improves your credit score, opening doors to better loan terms and lower interest rates in the future.

Why is Debt Management Important?
Uncontrolled debt can have a significant negative impact on your financial well-being. Here's why managing your debt effectively is crucial:

Reduced Financial Stress: The constant worry about looming debt payments can take a toll on your mental health. Effective debt management reduces stress and allows you to focus on achieving your financial goals.
Improved Credit Score: Timely payments and decreasing debt balances contribute positively to your credit score. A good credit score qualifies you for better interest rates on loans and mortgages, saving you money in the long run.
Financial Flexibility: By freeing up income previously used for minimum debt payments, you gain the flexibility to save for emergencies, invest for the future, or pursue other financial goals.
Increased Savings Potential: Reducing debt frees up additional income that can be directed towards savings goals, like a down payment on a house or retirement savings.
Benefits of Effective Debt Management:
The benefits of managing your debt effectively extend beyond just financial well-being. It fosters a sense of control over your finances, boosts self-confidence, and empowers you to make informed financial decisions for the future.

Understanding Different Types of Debt: Not All Debt is Created Equal
Debt can be categorized into two main types: good debt and bad debt. While both involve borrowing money, they differ significantly in their impact on your financial health.

Good Debt: Investing in Your Future
Good debt is used for investments that appreciate in value or generate future income, ultimately increasing your net worth. Here are some examples of good debt:

Mortgages: Financing a home allows you to build equity and potentially create wealth over time.
Student loans: Investing in education can lead to higher earning potential, enabling you to pay off the debt and improve your overall financial standing.
Small business loans: Borrowing to start or grow a successful business can create long-term income streams.
Key Characteristics of Good Debt:

Invests in your future: Good debt helps you acquire assets that appreciate in value or generate income over time.
Manageable payments: The loan terms and interest rates allow for comfortable repayment without straining your budget.
Long-term benefits: Good debt contributes to your overall financial well-being and future earning potential.
Bad Debt: A Drain on Your Resources
Bad debt is used to finance purchases that depreciate in value or provide no long-term financial benefit. It can quickly spiral out of control due to high interest rates and minimum payments that only cover a portion of the principal balance. Here are some examples of bad debt:

Credit card debt: High interest rates on credit cards can trap you in a cycle of debt if not managed responsibly.
Payday loans: These short-term, high-interest loans are meant to be repaid with your next paycheck but often lead to a debt trap due to exorbitant fees and rollovers.
Debt for non-essential purchases: Financing everyday purchases or luxury items with high-interest credit card debt can significantly drain your financial resources.

Key Characteristics of Bad Debt:

Funds depreciating assets: Bad debt is used to finance purchases that lose value over time, providing no long-term financial gain.
High interest rates: The cost of borrowing is high, making it difficult to pay off the principal balance quickly.

Strain on your budget: Minimum payments can be a significant burden on your income, leaving less money available for essential expenses and savings goals.
Negative impact on credit score: Missed payments and high credit card utilization (the amount of credit used compared to the credit limit) can significantly damage your credit score.
The Bottom Line:

Understanding the distinction between good debt and bad debt is crucial for making informed financial decisions. Prioritize paying off bad debt first to free up your income and improve your financial standing. While good debt can be a valuable tool, manage it responsibly to avoid falling into a debt trap.

Creating a Budget to Tackle Debt: Taking Control of Your Finances
A budget is your roadmap to financial freedom. It allows you to track your income and expenses, identify areas where you can save money, and allocate funds towards debt repayment. Here's a step-by-step guide to creating a budget specifically for tackling debt:

Step 1: Gather Your Financial Information:

Collect all your bank statements, credit card statements, and pay stubs.
List all your income sources (salary, side hustles, etc.) and their average monthly amount.
List all your expenses, categorized as fixed (rent, utilities, loan payments) and variable (groceries, entertainment, dining out).
Step 2: Track Your Spending:

Use a budgeting app, spreadsheet, or simply a pen and paper to record your daily expenses for a month.
Categorize your spending to identify areas where you can potentially cut back.
Step 3: Analyze Your Income and Expenses:

Compare your total income with your total expenses.
Are you spending more than you earn? If so, identify areas where you can reduce expenses.
Step 4: Prioritize Your Debt:

Debt Snowball Method: This method focuses on paying off the smallest debt first, regardless of interest rate. Seeing debts disappear quickly provides motivation to tackle larger ones.
Debt Avalanche Method: This method prioritizes paying off the debt with the highest interest rate first, saving you money on interest charges in the long run.
Step 5: Create a Debt Repayment Plan:

Based on your chosen debt repayment method, allocate a specific amount of money towards debt repayment each month.
Consider allocating any additional income (tax refunds, bonuses) towards debt principal to accelerate payoff.
Step 6: Adjust Your Budget Accordingly:

Be realistic about your spending habits. Factor in additional expenses like car repairs or holidays and adjust your budget accordingly.
Review your budget regularly to ensure you're on track and make adjustments as needed.
Step 7: Automate Your Finances:

Set up automatic transfers from your checking account to cover your debt payments and savings goals. This ensures you stay on track and avoid late fees.
Additional Tips for Effective Debt Management:

Increase Your Income: Explore ways to increase your income, such as taking on a side hustle or negotiating a raise.
Reduce Unnecessary Expenses: Cut back on non-essential spending like dining out or entertainment to free up more money for debt repayment.
Consider Debt Consolidation: This involves combining multiple debts into one loan with a potentially lower interest rate, simplifying your repayment process and potentially saving money.
Seek Help if Needed: If you're struggling to manage your debt on your own, consider seeking help from a credit counselor or financial advisor. They can provide personalized guidance and explore debt-relief options.
Remember: Debt management is a journey, not a destination. There will be setbacks along the way. Stay focused, celebrate your progress, and don't hesitate to adjust your plan as needed. With discipline and a solid budget, you can achieve your debt-free goals and build a brighter financial future.
          """,
          """Debt. It's a four-letter word that can strike fear into the hearts of many. But before you let debt drown you in worry, it's important to understand the different types you might encounter. Knowledge is power, and in this case, it's the first step to smart debt management.

There are two main ways to categorize debt: secured and unsecured. Secured debt uses collateral, like a house or car, as security for the loan. If you fail to repay a secured loan, the lender can seize the collateral to recoup their losses. Mortgages and auto loans are prime examples of secured debt. They often come with lower interest rates because the lender has a safety net in case of default.

Unsecured debt, on the other hand, relies solely on your creditworthiness to be repaid. There's no collateral involved, so lenders typically charge higher interest rates to compensate for the increased risk. Credit cards, personal loans, and medical bills are all forms of unsecured debt.

Another way to classify debt is by its repayment structure. Revolving debt features a credit limit that you can borrow against repeatedly, like a credit card. Minimum payments are required each month, but you can also pay off the entire balance to avoid accruing interest on future purchases.

Installment debt, in contrast, involves a fixed loan amount that you repay in equal installments over a set period. Mortgages, auto loans, and some student loans fall under this category. You'll have a set monthly payment that goes towards both principal (the original amount borrowed) and interest.

So, why is it important to understand these different types of debt? Here's the key: it impacts your repayment strategy. Secured debt with lower interest rates might be tackled differently than high-interest credit card debt. Likewise, a revolving credit line requires a different approach than a fixed-term installment loan.

By understanding the type of debt you have, you can make informed decisions about repayment. You can prioritize high-interest debt first, explore options like debt consolidation for multiple unsecured debts, and leverage budgeting tools to manage your repayments effectively.

Remember, debt doesn't have to control you. By familiarizing yourself with the different types and building a solid debt management strategy, you can take charge of your finances and move towards a brighter financial future.  Stay tuned for our next article where we'll delve into creating a budget to tackle debt!""",
          """Debt can feel like a heavy weight, but with a well-crafted budget, you can transform it into a manageable hurdle and ultimately achieve financial freedom.  A budget acts as your roadmap, outlining your income and expenses, and allocating your hard-earned money strategically.  By prioritizing debt repayment within your budget, you can develop a clear plan to conquer it.

Here's a step-by-step guide to creating a budget specifically designed to tackle debt:

Step 1: Gather Your Financial Information

The first step is to gather all your financial documents. This includes your pay stubs, bank statements (checking and savings), credit card statements, and any loan documentation you have.  Knowing exactly how much money comes in (income) and goes out (expenses) is crucial for creating an accurate budget.

Step 2: Track Your Spending

For a month, meticulously track every penny you spend. There are several ways to do this: jot down expenses in a notebook, utilize budgeting apps, or download spreadsheets specifically designed for expense tracking.  Don't be discouraged by the details – every coffee purchase and grocery bill adds to the bigger picture.

Step 3: Categorize Your Expenses

Once you have a month's worth of spending documented, categorize your expenses.  Common categories include housing (rent or mortgage), utilities, food, transportation, insurance, debt payments, entertainment, and miscellaneous.  Assigning each expense to a category allows you to analyze where your money goes and identify areas where you can potentially cut back.

Step 4: Choose a Budgeting Method

There are several popular budgeting methods, each with its own advantages. Here are two common approaches:

The 50/30/20 Rule: This rule allocates 50% of your income towards essential needs (housing, utilities, groceries), 30% towards wants (entertainment, dining out), and 20% towards savings and debt repayment. It's a simple and effective way to prioritize spending.

Zero-Based Budgeting: This method requires assigning every dollar of your income a specific job. You list all your income sources and then subtract your planned expenses from that total. Ideally, you should end up with zero leftover, with every dollar allocated towards a specific need, want, savings goal, or debt repayment.

Step 5: Prioritize Debt Repayment

Now comes the crucial step: allocating funds specifically for debt repayment within your budget.  Here's where understanding your different debt types comes in handy. You might choose to:

Focus on High-Interest Debt First: Prioritize paying down debt with the highest interest rates first (credit cards typically) to minimize the total interest you pay over time.
Utilize the Debt Avalanche Method: This method involves throwing the most money possible at the debt with the highest balance, regardless of interest rate. Once that debt is paid off, you move on to the next largest balance, and so on.
Consider the Debt Snowball Method: This method prioritizes paying off the smallest debt balances first, regardless of interest rate. The quick wins provide a sense of accomplishment and can boost motivation to tackle larger debts.
Step 6: Be Realistic and Track Your Progress

Creating a realistic budget is key to long-term success. Don't set yourself up for failure with unrealistic spending cuts.  Be honest about your needs and wants, and leave some room for flexibility.  As you go along, track your progress and adjust your budget as needed. Celebrate your milestones, no matter how small, to stay motivated.

Example:

Let's say you earn \$4,000 per month. Using the 50/30/20 rule, you would allocate:

Needs (Housing, Utilities, Groceries): \$2,000 (50%)
Wants (Entertainment, Dining Out): \$1,200 (30%)
Savings & Debt Repayment: \$800 (20%)
Within the savings and debt repayment category, you might choose to allocate \$500 towards your high-interest credit card debt and \$300 towards your student loan payment.

Remember, a budget is a living document, not set in stone.  Review and adjust it regularly to reflect your changing circumstances and financial goals.  With a well-crafted budget and a commitment to debt repayment, you can take control of your finances and pave the way for a brighter financial future.""",
          """Negotiating with Creditors for Lower Rates: Talking Your Way to Debt Relief
Debt can feel like a burden, and the high interest rates attached to it only add to the weight. But before you resign yourself to years of hefty payments, consider this: you might be able to negotiate for a lower interest rate with your creditors.  By effectively communicating your situation and demonstrating your commitment to repayment, you could significantly reduce your monthly payments and save a substantial amount of money in the long run.

Here's a guide to equip you for negotiating with creditors for lower rates:

Before You Negotiate:

Know Your Numbers: Gather your credit card statements and loan documents to understand your current interest rates, outstanding balances, and minimum payment requirements.
Evaluate Your Creditworthiness: Check your credit score to understand how creditors perceive your credit risk. A good credit score can strengthen your negotiating position.
Prepare a Budget: Create a realistic budget that demonstrates your ability to afford a lower monthly payment. This shows creditors you're serious about repayment.
Initiating the Negotiation:

Contact Your Creditor: The best way to initiate a negotiation is by calling your creditor's customer service department. Be polite, professional, and explain your situation.
Explain Your Hardship: Briefly explain why you're struggling to make your current payments. Be honest but avoid negativity. Focus on solutions rather than dwelling on problems.
Highlight Your Commitment: Emphasize your commitment to repaying your debt. Demonstrate this by mentioning your budget and any steps you've taken to improve your financial situation.
Negotiation Strategies:

Lower Interest Rate: This is your primary goal. Ask for a specific interest rate reduction and be prepared to justify your request. Mention your on-time payment history or your good credit score as leverage.
Reduced Minimum Payment: If a lower interest rate isn't achievable, negotiate for a reduced minimum payment. This will free up some cash flow to put towards the principal amount, accelerating your debt payoff.
Debt Consolidation: If you have multiple credit card debts, consider proposing debt consolidation. This involves combining your debts into a single loan with a potentially lower interest rate, simplifying your repayment process.
Be Prepared to Walk Away:

Negotiation is a two-way street. If the creditor isn't receptive to your proposals, be prepared to walk away politely.  Thank them for their time and consider trying again later or exploring other options, such as seeking help from a credit counseling service.

Additional Tips:

Be Polite and Professional: Maintain a respectful and courteous demeanor throughout the negotiation.
Do Your Research: Be aware of current interest rates for similar debt products. This knowledge strengthens your position when negotiating.
Get Everything in Writing: If you reach an agreement with your creditor, ensure you get it documented in writing. This protects you from any misunderstandings in the future.
Negotiating with creditors can be daunting, but with the right preparation and approach, you can potentially secure lower interest rates and make significant progress towards becoming debt-free. Remember, knowledge is power. The more informed you are, the better equipped you'll be to advocate for yourself and achieve a successful outcome.""",
          """Juggling multiple debts with varying interest rates and due dates can feel overwhelming.  Debt consolidation offers a potential solution by streamlining your repayments into a single, more manageable loan.  This strategy can simplify your finances, potentially save you money on interest, and help you achieve debt freedom faster. However, it's not a one-size-fits-all solution, and careful consideration is crucial before diving in.

Understanding Debt Consolidation:

Debt consolidation involves taking out a new loan to pay off existing debts. This can be achieved through various methods:

Balance Transfer Credit Cards: These cards offer a 0% introductory APR period on transferred balances, allowing you to focus on paying down the principal amount without accruing interest for a limited time. However, be mindful of often high balance transfer fees and skyrocketing interest rates after the introductory period ends.
Personal Loans: Unsecured personal loans can be used to consolidate various debts, potentially offering a lower interest rate than your existing debts. This can simplify repayment and potentially save you money.
Home Equity Loans or Lines of Credit (HELOC): If you own a home with equity (ownership stake), you can leverage it to secure a loan with potentially lower interest rates than unsecured options. However, this method comes with the risk of foreclosure if you fail to repay the loan.
Benefits of Debt Consolidation:

Simplified Repayment: Consolidating your debts into one loan simplifies your repayment process with a single monthly payment and due date. This reduces the risk of missed payments and late fees.
Potentially Lower Interest Rates: By consolidating high-interest debt (like credit cards) into a lower-interest loan, you can potentially save a significant amount of money on interest charges over time.
Improved Cash Flow: A lower monthly payment from debt consolidation can free up cash flow that can be directed towards accelerated debt repayment or building an emergency fund.
Things to Consider Before Consolidation:

Your Credit Score: Debt consolidation typically requires a good credit score to qualify for favorable interest rates. If your credit score is low, you might not be offered a significantly lower rate, making consolidation less advantageous.
The Total Loan Amount: Consolidation doesn't eliminate your debt; it simply changes how you repay it. Ensure the total loan amount, including interest and fees, doesn't exceed your ability to repay.
Temptation to Take on More Debt: Resist the urge to use the newfound available credit on your consolidated loan or credit cards. The goal is to repay existing debt, not accumulate more.
Choosing the Right Consolidation Option:

The best debt consolidation option depends on your individual circumstances. Consider factors like interest rates, loan terms, fees, and your creditworthiness.

Balance transfer cards might be suitable for short-term consolidation if you can pay off the balance before the introductory APR period ends.
Personal loans offer more flexibility and potentially lower interest rates compared to credit cards, but qualifying for a favorable rate requires good credit.
Home equity loans/lines of credit can provide access to lower interest rates due to the collateral involved, but come with the risk of losing your home if you default on the loan.
Remember: Debt consolidation is a tool, not a magic solution. Carefully assess your situation, choose the right strategy, and stick to a responsible repayment plan to achieve debt freedom.""",
          """Debt can feel like a heavy anchor, dragging you down and hindering your financial progress. The good news is, you don't have to be adrift in a sea of debt. Debt payoff plans act as your life raft, offering a structured approach to conquer your debt and reach the shores of financial freedom. Here's a deep dive into the many benefits of utilizing a debt payoff plan:

1. Increased Clarity and Direction:

Feeling overwhelmed by multiple debts with varying interest rates and due dates is a common experience. A debt payoff plan cuts through the confusion by laying out a clear roadmap. It outlines your creditors, balances, interest rates, and most importantly, a strategic approach to pay them off. This clarity empowers you to make informed decisions about your finances and track your progress towards becoming debt-free.

2. Prioritization and Focus:

Not all debts are created equal. High-interest credit card debt can snowball quickly, whereas student loans might offer fixed interest rates and flexible repayment options. A debt payoff plan helps you prioritize your debts strategically. You can choose to tackle high-interest debt first, minimizing the total interest you pay over time. This focused approach allows you to make the most impactful strides towards debt elimination.

3. Enhanced Motivation and Accountability:

Seeing your debt shrink month after month is a powerful motivator. A debt payoff plan allows you to witness your progress in real-time, keeping you energized and focused on your financial goals. Additionally, the structure and accountability inherent in a plan can prevent you from falling back into unhealthy spending habits. Sticking to your plan becomes a badge of honor, a testament to your commitment to financial well-being.

4. Improved Cash Flow Management:

Debt payments often consume a significant portion of your income. A well-crafted debt payoff plan helps you streamline your repayments, potentially lowering your overall monthly payment. This frees up additional cash flow that can be allocated towards essential expenses, building an emergency fund, or even accelerating your debt repayment progress.

5. Reduced Stress and Improved Well-being:

The burden of debt can be a significant source of stress, impacting your mental and emotional health. A debt payoff plan offers a sense of control and direction, alleviating the anxiety associated with unmanaged debt. As you make progress towards your goals, the stress burden diminishes, allowing you to breathe easier and focus on enjoying life.

6. Building a Foundation for Financial Security:

Debt freedom is more than just eliminating numbers on a page. It's about building a solid foundation for your financial future. By conquering your debt, you free up resources for important financial goals, such as saving for a down payment on a house, investing for retirement, or simply having a safety net for emergencies. This newfound financial security allows you to live with greater peace of mind and face the future with confidence.

In Conclusion:

A debt payoff plan is not a magic bullet, but it's a powerful tool that can empower you to take control of your finances and achieve your financial goals. By providing clarity, focus, and motivation, a well-structured plan becomes your compass on the journey to financial freedom. So, take the first step today – create your debt payoff plan and set sail towards a brighter financial future.""",
          """Building an Emergency Fund to Avoid Debt: Your Safety Net for Financial Security
Debt can feel like a constant threat, looming over your head and waiting to pounce at the first unexpected expense.  Car repairs, medical bills, or appliance breakdowns – life has a way of throwing curveballs. But what if you had a financial cushion to absorb these shocks without resorting to debt? That's where an emergency fund comes in.

An emergency fund acts as your financial safety net, a pool of money set aside specifically to cover unexpected expenses.  By building a healthy emergency fund, you can avoid the trap of high-interest debt and navigate financial challenges with greater peace of mind.

The Advantages of an Emergency Fund:

Prevents Debt Accumulation: Unexpected expenses are a leading cause of debt. With an emergency fund, you can cover these costs without relying on credit cards or loans that rack up interest charges. This can save you a significant amount of money in the long run.
Reduces Stress and Anxiety: Financial emergencies are stressful, but having a safety net can significantly alleviate that anxiety. Knowing you have resources to handle unexpected situations allows you to approach challenges with a calmer and more collected mind.
Protects Your Financial Goals: Debt can derail your financial plans, like saving for a down payment on a house or investing for retirement. An emergency fund safeguards your progress by ensuring unexpected expenses don't force you to dip into your long-term savings goals.
Provides Peace of Mind: Financial security is a cornerstone of overall well-being. Knowing you have a buffer against unforeseen circumstances fosters a sense of control and allows you to focus on your financial goals with greater confidence.
How Much Should You Save?

A common recommendation is to save 3-6 months' worth of living expenses in your emergency fund. This amount can vary depending on your individual circumstances. Consider factors like your income stability, job security, and the presence of dependents when determining your ideal emergency fund target.

Building Your Emergency Fund:

Start Small: Don't get discouraged by the seemingly large goal. Begin with small, manageable contributions, even if it's just a few dollars a week. Consistency is key.
Automate Savings: Set up an automatic transfer from your checking account to your emergency savings account. This "set it and forget it" approach ensures regular contributions without relying on willpower.
Review Your Budget: Identify areas where you can cut back on unnecessary spending and redirect those funds towards your emergency fund. Every little bit saved adds up.
Consider Windfalls: Treat tax refunds, bonuses, or unexpected income as an opportunity to boost your emergency fund savings.
Where to Save Your Emergency Fund:

High-Yield Savings Account: Look for a savings account with a competitive interest rate to maximize your returns while maintaining easy access to your funds.
Money Market Account: These accounts offer slightly higher interest rates than traditional savings accounts, with limited check-writing capabilities.
Building an emergency fund takes time and discipline, but the benefits are well worth the effort. By creating a financial safety net, you empower yourself to avoid debt, manage unexpected challenges with ease, and pave the way for a more secure financial future. So, start building your emergency fund today and take control of your financial well-being.""",
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