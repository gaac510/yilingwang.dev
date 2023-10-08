alter table "public"."articles" enable row level security;

create policy "Enable delete for authenticated users only"
on "public"."articles"
as restrictive
for delete
to authenticated
using (true);


create policy "Enable insert for authenticated users only"
on "public"."articles"
as restrictive
for insert
to authenticated
with check (true);


create policy "Enable read access for all users"
on "public"."articles"
as restrictive
for select
to public
using (true);


create policy "Enable update for authenticated users only"
on "public"."articles"
as restrictive
for update
to authenticated
using (true)
with check (true);