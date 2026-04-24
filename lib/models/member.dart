class Member {
  final String name;
  final String role;
  final String nim;
  final String bio;
  final String motto;
  final String contribution;
  final String email;
  final String instagramHandle;
  final String instagramUrl;
  final List<String> skills;
  final String imagePath;
  final String videoPath;
  final List<String> hobbies;

  Member({
    required this.name,
    required this.role,
    required this.nim,
    required this.bio,
    required this.motto,
    required this.contribution,
    required this.email,
    required this.instagramHandle,
    required this.instagramUrl,
    required this.skills,
    required this.imagePath,
    required this.videoPath,
    required this.hobbies,
  });
}

final List<Member> groupMembers = [
  Member(
    name: 'Muhammad Fauzan',
    role: 'Project Leader & Developer',
    nim: '0112524027',
    bio:
        'Fullstack Developer & ETL Specialist with 3+ years of experience. Currently leading internal ecosystems at PT Maha Sentral Sejati for 2,500+ users. Experienced in Flutter, .NET Core, and Data Engineering. I love building tools that automate repetitive tasks and simplify complex workflows.',
    motto: '"Bridging complex technical requirements with business goals."',
    contribution: 'Project Lead, Core Architecture, Flutter Implementation.',
    email: 'fauzan14072004@gmail.com',
    instagramHandle: '@mfauzanlm_',
    instagramUrl: 'https://instagram.com/mfauzanlm_',
    skills: ['Flutter', '.NET Core', 'SQL Server', 'ETL (SSIS)', 'Vue.js'],
    hobbies: ['Coding', 'Reading Tech Blogs', 'Traveling'],
    imagePath: 'assets/images/fauzan.jpg',
    videoPath: 'assets/videos/fauzan.mp4',
  ),
  Member(
    name: 'Nadira Novita',
    role: 'UI/UX Designer',
    nim: '20220801002',
    bio:
        'Passionate about creating beautiful and user-friendly interfaces. Currently focusing on Informatics Engineering at Universitas Al Azhar Indonesia. I believe that good design is as little design as possible.',
    motto: '"Design is not just what it looks like. Design is how it works."',
    contribution: 'UI/UX Design, Asset preparation, and Research.',
    email: 'nadira@student.uai.ac.id',
    instagramHandle: '@nadira_design',
    instagramUrl: 'https://instagram.com/',
    skills: ['Figma', 'Adobe XD', 'Flutter UI', 'Prototyping'],
    hobbies: ['Drawing', 'Photography', 'Music'],
    imagePath: 'assets/images/nadira.jpg',
    videoPath: 'assets/videos/nadira.mp4',
  ),
  Member(
    name: 'Budi Sulistiyo',
    role: 'Informatics Engineering Student',
    nim: '0112523010',
    bio:
        'Mahasiswa Informatika dengan ketertarikan mendalam pada infrastruktur jaringan dan suka mengembangkan aplikasi menggunakan Python, serta aktif mendalami manajemen jaringan (Networking). Berfokus pada keamanan sistem dan otomatisasi infrastruktur.',
    motto: '"hidup itu sekali dan mati itu pasti"',
    contribution: 'Research materi dan dokumentasi aplikasi.',
    email: 'msjbudi@gmail.com',
    instagramHandle: '@budiii.s',
    instagramUrl: 'https://instagram.com/budiii.s',
    skills: [
      'Networking (Cisco/MikroTik)',
      'Python (Automation & Security)',
      'Cryptography & Cyber Security',
      'Linux Administration',
    ],
    hobbies: [
      'Network Simulation',
      'Python Scripting',
      'Cyber Security Research',
    ],
    imagePath: 'assets/images/budi.jpg',
    videoPath: 'assets/videos/budi.mp4',
  ),
  Member(
    name: 'Izzah Aulia Nur Risa',
    role: 'Informatics Engineering Student',
    nim: '0102523029',
    bio:
        'Mahasiswa Teknik Informatika di Universitas Al Azhar Indonesia yang memiliki minat besar dalam pengembangan aplikasi mobile dan analisis sistem. Fokus pada pembuatan solusi digital yang efisien dan user-friendly.',
    motto: '"Every day is a second chance."',
    contribution: 'Sistem Testing, Dokumentasi, dan Quality Assurance.',
    email: 'izzah.aulia@student.uai.ac.id',
    instagramHandle: '@izzahaulia_',
    instagramUrl: 'https://instagram.com/',
    skills: [
      'Flutter Development',
      'System Analysis',
      'Technical Documentation',
      'Software Testing',
    ],
    hobbies: ['Reading', 'Photography', 'Coding'],
    imagePath: 'assets/images/member4.jpg',
    videoPath: 'assets/videos/member4.mp4',
  ),
];
