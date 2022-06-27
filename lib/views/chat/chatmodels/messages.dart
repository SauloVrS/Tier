

import 'package:tier/views/chat/chatmodels/user.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User'
);

// USERS
final User greg = User(
  id: 1,
  name: 'Greg',
  
);
final User james = User(
  id: 2,
  name: 'James',
 
);
final User john = User(
  id: 3,
  name: 'John',
  
);
final User olivia = User(
  id: 4,
  name: 'Olivia',
  
);
final User sam = User(
  id: 5,
  name: 'Sam',
  
);
final User sophia = User(
  id: 6,
  name: 'Sophia',
  
);
final User steven = User(
  id: 7,
  name: 'Steven',
  
);
final User suzen = User(
  id: 8,
  name: 'suzen',
  
);
final User aika = User(
  id: 9,
  name: 'aika',
  
);
final User zarima = User(
  id: 10,
  name: 'zarima',
  
);
final User patima = User(
  id:11,
  name: 'patima',
  
);

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg,];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: suzen,
    time: '11:30 AM',
    text: 'Oi, quando vc vai entregar o cachorro?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: aika,
    time: '11:30 AM',
    text: 'Mano, vc disse que o gato era de raça',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: zarima,
    time: '11:30 AM',
    text: 'Que hrs posso pegar o cachorro?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: patima,
    time: '11:30 AM',
    text: 'Esse cachorro está destruindo minha casa. Posso devolver?',
    isLiked: false,
    unread: true,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
   Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Vc disse que o cachorro era um pastor mallinois',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Mas ele não cresce. PARECE que é um vira-lata caramelo',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Desculpe. quando filhotes, são muito parecidos',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Eu te entreguei o errado. O mallinois está aqui em casa',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'E agora?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'Fica o caramelo. Vai gostar muito.',
    isLiked: false,
    unread: true,
  ),
   Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Eu queria um cão de guarda.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: 'que pena',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Que pena?? essa é a sua resposta?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'Sim.',
    isLiked: false,
    unread: true,
  ),
];