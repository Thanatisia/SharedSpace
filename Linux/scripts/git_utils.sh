: "
- Useful Git Utilities and Functions
"

function git_sparse_clone() (
  : "
	Sparse Cloning Function

	Usage: 
		git_sparse_clone "http://github.com/author/project" "./path/to/repository" "/bin"
  "
  rurl="$1" 
  localdir="$2" && shift 2

  mkdir -p "$localdir"
  cd "$localdir"

  git init
  git remote add -f origin "$rurl"

  git config core.sparseCheckout true

  # Loops over remaining args
  for i; do
    echo "$i" >> .git/info/sparse-checkout
  done

  git pull origin master
)