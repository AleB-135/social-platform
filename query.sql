-- Seleziona gli utenti che hanno postato almeno un video

SELECT `username`, `posts`.`title`, `posts`.`date`, `medias`.`type`
FROM `users`
INNER JOIN `posts`
ON `users`.`id` = `posts`.`id`
INNER JOIN `media_post`
On `posts`.`id` = `media_post`.`post_id`
INNER JOIN `medias`
ON `media_post`.`media_id` = `medias`.`id` 
WHERE `medias`.`type` = 'video';


-- Seleziona tutti i post senza Like (13)

SELECT `title`, `posts`.`date`, `post_id`,`likes`.`user_id`
FROM `posts`
LEFT JOIN `likes`
ON `posts`.`id` = `likes`.`post_id`
WHERE `likes`.`post_id` IS NULL;

-- Conta il numero di like per ogni post (165 nel caso di query con SELECT + JOIN oppure 175 nel caso di query con sola SELECT)

SELECT `post_id`, COUNT(*) AS `numero_likes`
FROM `likes`
GROUP BY `post_id`;

-- Ordina gli utenti per il numero di media caricati (25) 

SELECT `user_id`, COUNT(*) AS `media_caricati`
FROM `medias`
GROUP BY `user_id`
ORDER BY `media_caricati` ASC;


-- Ordina gli utenti per totale di likes ricevuti nei loro posts (25) 

SELECT `user_id`, COUNT(*) AS `likes_ricevuti`
FROM `likes`
GROUP BY `user_id`
ORDER BY `likes_ricevuti` ASC;