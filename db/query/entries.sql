-- name: CreateEntry :one
INSERT INTO ENTRIES (
    account_id,
    amount
) VALUES (
    $1,
    $2
) RETURNING *;

-- name: GetEntry :one
SELECT * FROM ENTRIES WHERE id = $1;

-- name: ListEntries :many
SELECT * FROM ENTRIES ORDER BY id
LIMIT $1
OFFSET $2;

-- name: UpdateEntry :one
UPDATE ENTRIES SET
    amount = $2
WHERE id = $1
RETURNING *;

-- name: DeleteEntry :exec
DELETE FROM ENTRIES WHERE id = $1;