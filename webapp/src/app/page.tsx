import Link from "next/link";

function Home() {
  return (
    <main>
      <nav>
        <ul>
          <li>
            <Link href="/about">about</Link>
          </li>
          <li>
            <Link href="/privacy-policy">privacy policy</Link>
            {/** @todo What other pages should I have? */}
          </li>
        </ul>
      </nav>
    </main>
  );
}

export default Home;
