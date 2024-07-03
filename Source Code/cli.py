#! /usr/bin/env python

import subprocess as sp
import pymysql
import pymysql.cursors
from datetime import datetime
from datetime import timedelta
from prettytable import PrettyTable

def PrettyPrint(data):
    if not data:
        print("Errrr. The result of query is null set.")
        return 0
    ColumnNames = list(data[0].keys())
    Table = PrettyTable(ColumnNames)
    for row in data:
        Table.add_row(list(row.values()))
    print(Table)
    return 0

def Pprint(output):
    i=0
    for z in output[0]:
        print(z,end='\t\t')
    print()
    for x in output:
        i+=1
       # print("Output no. - ",i)
       # print(x)
        for a in x:
            print(x[a],"\t\t",end='')
        print()



def getMaxFromTable(S):
    try:
        query = "SELECT MAX(id) FROM {};".format(S)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()

        return output[0]['MAX(id)']

    except Exception as e:
        con.rollback()
        print("Failed to getMax Value.")
        print(">>>>>>>>>>>>>", e)

    return -1

def addUser():
    try:
        # Takes user  details as input
        row = {}
        print("Enter new user's details: ")
        uname = (input("Username: "))
        name = (input("Your name: "))
        age = int(input("Age: "))
        row["Date"] = datetime.today().strftime('%Y-%m-%d')
        row["id"] = getMaxFromTable("users")+1
        query = "INSERT INTO users(id, username, name, age, joining_date) VALUES\
        ('%d', '%s', '%s', '%d', '%s')" % (
                row["id"], uname, name, age, row["Date"])

        #print(query)
        cur.execute(query)
        con.commit()

        print("Inserted User Details Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def listenSongByUser():
    try:
        # Takes user  details as input
        Row = {}
        uname = (input("Your username: "))
        sname = (input("Song name: "))
        Row["time"] = datetime.today().strftime('%Y-%m-%d %H:%M:%S')
        query1 = """
select id,TIME_TO_SEC(duration) as X from songs where name="{}";
        """ .format(sname)
        cur.execute(query1)
        con.commit()
        output1 = cur.fetchall()
        sid = output1[0]['id']
        dur = output1[0]['X']

        query2 = """
select id  from users where username="{}";
        """ .format(uname)
        cur.execute(query2)
        con.commit()
        output2 = cur.fetchall()
        output2 = output2[0]['id']
        
        query3="""
INSERT INTO listens(user_id,song_id,`timestamp`,duration)
VALUES ({},{},"{}",{});

        """ .format(output2,sid,Row['time'],dur)
        print(query3)
        cur.execute(query3)
        con.commit()

        print("User listened a song.")
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def createPlaylist():
    try:
        # 2) Takes user  details as input
        row = {}
        pname = (input("Enter Name of Playlist: "))
        uname = (input("Enter username: "))
        status = (input("Enter status of new playlist: "))

        query2 = """
select id  from users where username="{}";
        """ .format(uname)
        cur.execute(query2)
        con.commit()
        output2 = cur.fetchall()
        uid = output2[0]['id']
        
        query = """
INSERT INTO playlists(name,user_id,status)
VALUES ("{}",{},"{}");

"""  .format(pname,uid,status)

       # print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()

        print("Added new playlist.")

    except Exception as e:
        con.rollback()
        print("Failed to createPlaylist:")
        print(">>>>>>>>>>>>>", e)

    return

def addSongToPlaylist():
    try:
        # 2) Takes user  details as input
        row = {}
        pname = (input("Enter Name of Playlist: "))
        uname = (input("Enter username: "))
        sname = (input("Enter song sname: "))

        query1 = """
select id from songs where name="{}";
        """ .format(sname)
        cur.execute(query1)
        con.commit()
        output1 = cur.fetchall()
        sid = output1[0]['id']
        
        query2 = """
select id  from users where username="{}";
        """ .format(uname)
        cur.execute(query2)
        con.commit()
        output2 = cur.fetchall()
        uid = output2[0]['id']
        
        query3 = """
INSERT INTO playlist_songs(playlist_name,song_id,creator_user_id,editor_user_id)
VALUES ("{}",{},{},{});
"""  .format(pname,sid,uid,uid)

       # print(query3)
        cur.execute(query3)
        con.commit()
        output = cur.fetchall()

        print("Added song to playlist.")

    except Exception as e:
        con.rollback()
        print("Failed to createPlaylist:")
        print(">>>>>>>>>>>>>", e)

    return
def selectAllSongsOfCreator():
    try:
        # Takes user  details as input
        row = {}
        name = (input("Enter Name of Creator: "))
        row["Name"] = name

        query = """select distinct creators.name,songs.name,        
        songs.duration from ((creators join release_information on     
        creators.id=release_information.creator_id  ) join songs on       
        songs.id=release_information.song_id)  where creators.name="{}";
        """ .format(name)

        cur.execute(query)
        con.commit()
        output = cur.fetchall()


        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return

def bandsUserListenThisMonth():
    try:
        # 2) Takes user  details as input
        row = {}
        name = (input("Enter Name of User: "))
        row["Name"] = name
        todayDate = datetime.today().strftime('%Y-%m-%d')
        lastMonth = (datetime.today() - timedelta(days=30)).strftime('%Y-%m-%d')
        query = """select distinct creators.name from ((users
        join listens on users.id=listens.user_id)
join worked_on on listens.song_id=worked_on.song_id ) 
join creators on worked_on.creator_id
=creators.id 
where users.username = "{}" and date(listens.timestamp)
between "{}" and "{}" ;
"""  .format(name,lastMonth,todayDate)

        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()

        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return

def usersLastYear():
    try:
        # 2) Takes user  details as input
        row = {}

        name = (input("Enter 2 dates in YYYY-MM-DD format: ")).split(' ')
        query = """select username,name,joining_date from users where
        date(joining_date) between "{}" and "{}";
""".format(name[0],name[1])

        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()

        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return

def creatorsWithAwards():
    try:
        # 2) Takes user  details as input
        row = {}

        query = """select creators.name, count(creators.name) 
        from creators join creator_awards
        on creators.id = creator_awards.creator_id
        group by name;
"""

        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()

        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return
def songsWithMoreThanXPlays():
    try:
        # 2) Takes user  details as input
        row = {}

        name = (input("Enter number of views to query: ")).split(' ')
        row["num"] = name[0]
        query = """select name, times_played from songs_view
        where times_played >= {};
""".format(name[0])

        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()

        PrettyPrint(output)
    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return
def playsInAlbum():
    try:
        # 2) Takes user  details as input
        row = {}

        name = (input("Enter name of album: "))
        row["num"] = name
        query = """select name,sum(times_played) from  
        release_information  join songs_view on 
        songs_view.id=release_information.song_id  where
        release_information.album_name="{}"
        group by songs_view.id;
""" .format(name)

        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()

        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return
def usersWhoseNameStartWithX():
    try:
        # 2) Takes user  details as input
        row = {}

        name = (input("Enter first letters of username: "))
        row["name"] = name
        query = """select id,username,name from
        users where username like '{}%';
""" .format(name)

        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()

        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return
def creatorsWithLessThanXViews():
    try:
        # 2) Takes user  details as input
        row = {}

        name = (input("Enter number of views: ")).split(' ')
        row["num"] = name[0]
        query = """select * from (select Distinct creators.name
        as Cname,sum(times_played)
        as Plays from ((creators join worked_on on 
        creator_id=creators.id)
                join songs_view on songs_view.id = worked_on.song_id)
        group by Cname) as X where Plays <= {};
""" .format(name[0])

        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()

        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return
def creatorsWithLessThanXViewsAndAwards():
    try:
        # 2) Takes user  details as input
        row = {}

        name = (input("Enter number of views: ")).split(' ')
        row["num"] = int(name[0])
        query = """(select creators.name from creators 
                    join creator_awards on creators.id = creator_awards.creator_id 
                    group by name) 
                    intersect 
                    (select Cname 
                    from (select Distinct creators.name as Cname,sum(times_played) as Plays from ((creators join worked_on on creator_id=creators.id) 
                join songs_view on songs_view.id = worked_on.song_id)
        group by Cname) as X where Plays <= {});""" .format(name[0])

        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()

        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return
def usersHavingMoreThanXPlays():
    try:
        # 2) Takes user  details as input
        row = {}

        name = (input("Enter number of plays: "))
        row["num"] = name[0]
        query = """select username,C as Views from 
        (select users.username,count(users.id)
        as C from users join listens on users.id = listens.user_id 
        group by users.id) as X  where C >= {} ;
""" .format(name[0])

        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()

        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return
def usersWithXPlaysInGenreY():
    try:
        # 2) Takes user  details as input
        row = {}

        name = (input("Enter number of views: "))
        num = (input("Enter genre: "))
        query =  """select * from (select name,count(name)
        as Genre_count from
        (select name,genre from users join listens
                on users.id = listens.user_id join song_genres 
                on listens.song_id = song_genres.song_id  where genre='{}')
        as X group by name)
        as Y where Genre_count>={} ;""" .format(num,name)

        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()

        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return
def userReport():
    try:
        # 2) Takes user  details as input
        row = {}

        name = (input("Enter username: "))

        todayDate = datetime.today().strftime('%Y-%m-%d')
        lastYear = (datetime.today() - timedelta(days=365)).strftime('%Y-%m-%d')
        query =  """
        SELECT
( SELECT COUNT(*)
    FROM users
    INNER JOIN listens
    ON users.id = listens.user_id
    WHERE username = '{}'
    AND `timestamp` > '{}'
    AND `timestamp` < '{}') 
AS 'Number of songs listened this year',

( SELECT cr.name
    FROM users
    INNER JOIN listens
    ON users.id = listens.user_id
    INNER JOIN release_information ri ON listens.song_id = ri.song_id
    INNER JOIN creators cr ON ri.creator_id = cr.id
    where users.username = '{}'
    GROUP BY cr.id
    ORDER BY COUNT(*) DESC
LIMIT 1) AS 'Favourite Creator',

( SELECT genre
    FROM users
    INNER JOIN listens ON users.id = listens.user_id
    INNER JOIN song_genres sg ON listens.song_id = sg.song_id
    WHERE users.username = '{}'
    GROUP BY genre
    ORDER BY COUNT(*) DESC
LIMIT 1) AS 'Favourite Genre';

""" .format(name,lastYear,todayDate,name,name)

        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()

        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return
def generalReport():
    try:

        query =  """
SELECT
(SELECT name
    FROM songs_view
    ORDER BY times_played DESC
LIMIT 1) AS 'Most Popular Song',

( SELECT cr.name
    FROM creators cr
    INNER JOIN release_information ri ON cr.id = ri.creator_id
    INNER JOIN songs_view sv on ri.song_id = sv.id
    WHERE cr.type = 'individual'
    GROUP BY cr.id
    ORDER BY SUM(times_played) DESC
LIMIT 1) AS 'Most Popular Artist',

(SELECT genre
    FROM songs_view sv
    INNER JOIN song_genres sg ON sv.id = sg.song_id
    GROUP BY genre
    ORDER BY SUM(times_played) DESC
LIMIT 1) AS 'Most Popular Genre',

( SELECT al.name
    FROM albums al
    INNER JOIN release_information ri 
    ON al.name = ri.album_name AND al.creator_id = ri.creator_id
    INNER JOIN songs_view sv ON ri.song_id = sv.id
    GROUP BY al.name
    ORDER BY SUM(times_played) DESC
LIMIT 1) AS 'Most Listened Album',

( SELECT name
FROM creators cr
INNER JOIN creator_awards ca ON cr.id = ca.creator_id
WHERE cr.type = 'individual'
GROUP BY cr.id
ORDER BY COUNT(*) DESC
LIMIT 1) AS 'Most Prestigious Artist',

( SELECT name
    FROM creators cr
    INNER JOIN creator_awards ca ON cr.id = ca.creator_id
    WHERE cr.type = 'group'
    GROUP BY cr.id
    ORDER BY COUNT(*) DESC
LIMIT 1) AS 'Most Prestigious Band';
"""
        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()

        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return
def creatorReport():
    try:

        name = (input("Enter name of creator: "))
        query = """
        SELECT
(
SELECT COUNT(*) as "Number of Streams"
    FROM 
    (
        SELECT release_information.song_id, creators.id, listens.user_id, creators.name as Name FROM creators 
        INNER JOIN release_information on creators.id=release_information.creator_id
        INNER JOIN listens on release_information.song_id = listens.song_id 
        WHERE Name="{}"
    ) as aliastable1
) as "Total Number of Streams" ,
(
SELECT COUNT(*) as "Number of Songs"
    FROM
    (
    SELECT release_information.song_id, creators.id, creators.name as Name FROM creators 
    INNER JOIN release_information on creators.id=release_information.creator_id
    WHERE Name="{}"
    ) as aliastable2
) as "Total Number of Songs" ,
(
SELECT COUNT(DISTINCT genre) as "Different Number of Genres"
    FROM
    (
    SELECT release_information.song_id, creators.id, creators.name as Name, genre FROM creators 
    INNER JOIN release_information on creators.id=release_information.creator_id
    INNER JOIN song_genres on release_information.song_id = song_genres.song_id
    WHERE Name="{}"
    ) as aliastable3
) as "Total Number of different genres covered";""" .format(name,name,name)

        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()

        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return
def getAllUsers():
    try:
        # 2) Takes user  details as input
        query = """
    select * from users;
        """
        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()
        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return

def getAllSongs():
    try:
        # 2) Takes user  details as input
        query = """
    select * from songs ;
        """
        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()
        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return

def getAllCreators():
    try:
        # 2) Takes user  details as input
        query = """
    select * from creators;
        """
        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()
        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return

def allPlaylistsOfUserX():
    try:
        # 2) Takes user  details as input
        name = (input("Enter name of creator: "))
        query = """
  SELECT playlists.name
FROM users
INNER JOIN playlists ON users.id = playlists.user_id
WHERE users.username = '{}';
        """ .format(name)
        #print(query)
        cur.execute(query)
        con.commit()
        output = cur.fetchall()
        PrettyPrint(output)

    except Exception as e:
        con.rollback()
        print("Failed to selectAllSongsOfCreator:")
        print(">>>>>>>>>>>>>", e)

    return
def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        selectAllSongsOfCreator()
    elif(ch == 2):
        usersWithXPlaysInGenreY()
    elif(ch == 3):
        usersHavingMoreThanXPlays()

    elif(ch == 4):
        creatorsWithLessThanXViewsAndAwards()
    elif(ch == 5):
        creatorsWithLessThanXViews()
    elif(ch == 6):
        usersWhoseNameStartWithX()
    elif(ch == 7):
        playsInAlbum()
    elif(ch == 8):
        songsWithMoreThanXPlays()
    elif(ch == 9):
        creatorsWithAwards()
    elif(ch == 10):
        usersLastYear()
    elif(ch == 11):
        bandsUserListenThisMonth()
    elif(ch == 20):
        addUser()
    elif(ch == 21):
        listenSongByUser()
    elif(ch == 22):
        createPlaylist()
    elif(ch == 23):
        addSongToPlaylist()
    elif(ch == 30):
        generalReport()
    elif(ch == 31):
        userReport()
    elif(ch == 32):
        creatorReport()
    elif(ch == 40):
        getAllUsers()
    elif(ch == 41):
        getAllSongs()
    elif(ch == 42):
        getAllCreators()
    elif(ch == 43):
        allPlaylistsOfUserX()
    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)

    # Can be skipped if you want to hardcode username and password
    #username = input("Username: ")
    #password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server
        con = pymysql.connect(host='localhost',
                user="DNA",
                password="#Dnaproject123",
                db='Music',
                cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE> ")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. Select all songs of given creator.")
                print("2. Select all users which have more than "
                        "treshhold plays of given genre.")  
                print("3. Select Users having more than"
                        " treshhold plays.")  
                print("4. Select creators with less than "
                        "given views, but which have won"
                        " an award.")  # Employee Statistics
                print("5. Select creators with less than "
                        "given views.")
                print("6. Select all users whose name starts"
                        " with given string.")
                print("7. Calculate number of plays for an album. ")
                print("8. Select songs with more than X plays. ")
                print("9. Print all creators which have won an award.")
                print("10. Find users which have joined a platform bw"
                        " given dates.")
                print("11. List bands which user listened this month.")
                print("20. Add user.")
                print("21. Make user listen a song.")
                print("22. Create Playlist.")
                print("23. Add song to playlist.")
                print("30. Generate a general report.")
                print("31. Make a user report.")
                print("32. Produce a creator report.")
                print("40. Print all users.")
                print("41. Print all songs.")
                print("42. Print all creators.")
                print("43. Get all playlists created by given user.")
                print("0. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 0:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE> ")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE> ")

