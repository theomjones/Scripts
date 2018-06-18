reactComponent() {
  DIR=./src/Components/$1;
  mkdir -p $DIR;
  NAME=$1
  
  echo "import React from 'react'
import styles from './$NAME.css'

const $NAME = props => (
  <div className={styles.$NAME}>{props.children}</div>
)

export default $NAME" > $DIR/$NAME.js;

  echo "/*$NAME Component*/

.$NAME {

}" > $DIR/$NAME.css

}

# reactComponent <name>