delete
from user_role;
delete
from usr;

insert into usr(id, active, password, username)
values (1, true, '$2a$08$riRDbJL5e5tG8.Z6LWNjE.XaO/9sBSffzzWPMCNNMhUcjYld.RzRi', 'u'),
       (2, true, '$2a$08$riRDbJL5e5tG8.Z6LWNjE.XaO/9sBSffzzWPMCNNMhUcjYld.RzRi', 'mike');

insert into user_role(user_id, roles)
values (1, 'USER'),
       (1, 'ADMIN'),
       (2, 'USER');

